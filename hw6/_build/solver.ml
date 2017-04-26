open Datastructures

(* dataflow analysis graph signature ---------------------------------------- *)
(* Interface for dataflow graphs structured in a way to facilitate
   the general iterative dataflow analysis algorithm.

   The AsGraph functor in cfg.ml provides an implementation of this
   DFA_GRAPH signature that converts an LL IR control-flow graph to
   this representation.
*)
module type DFA_GRAPH =
  sig
    module NodeS : SetS
    type node = NodeS.elt

    (* dataflow facts associated with the nodes of this graph *)
    type fact

    (* the abstract type of dataflow graphs *)
    type t
    val preds : t -> node -> NodeS.t
    val succs : t -> node -> NodeS.t
    val nodes : t -> NodeS.t

    (* the flow function:
       given a graph node and input fact, compute the resulting fact on the
       output edge of the node                                                *)
    val flow : t -> node -> fact -> fact

    (* lookup / modify the dataflow annotations associated with a node *)
    val find_fact : t -> node -> fact
    val add_fact : node -> fact -> t -> t

    (* printing *)
    val to_string : t -> string
    val printer : Format.formatter -> t -> unit
  end

(* abstract dataflow lattice signature -------------------------------------- *)
(* The general algorithm works over a generic lattice of abstract "facts".
    - facts can be combined (this is the 'join' operation)
    - facts can be compared                                                   *)
module type FACT =
  sig
    type t
    val combine : t list -> t
    val compare : t -> t -> int
  end

(* generic iterative dataflow solver ---------------------------------------- *)
(* This functor takes two modules:
      Fact  - the implementation of the lattice
      Graph - the dataflow anlaysis graph

   It produces a module that has a single function 'solve', which
   implements the iterative dataflow analysis described in lecture.
      - using a worklist (or workset) nodes
        [initialized with the set of all nodes]

      - process the worklist until empty:
          . choose a node from the worklist
          . find the node's predecessors and combine their flow facts
          . apply the flow function to the combined input to find the new
            output
          . if the output has changed, update the graph and add the node's
            successors to the worklist

   TASK: complete the [solve] function, which implements the above algorithm.
*)
module Make (Fact : FACT) (Graph : DFA_GRAPH with type fact := Fact.t) =
  struct
    let solve (g:Graph.t) : Graph.t =
      let worklist_nodes = Graph.NodeS.elements (Graph.nodes g) in
      let rec graph_iter (graph : Graph.t) (nodes : Graph.NodeS.elt list) : Graph.t =
        begin match nodes with
        | [] -> graph
        | cur_node::rem_nodes ->
        let cur_preds = Graph.preds graph cur_node in
        let combined_fact = Graph.NodeS.fold (fun elt2 fl ->
          fl @ [Graph.find_fact graph elt2]
          ) cur_preds [] in
        let pred_flow = Fact.combine combined_fact in
        let new_output = Graph.flow graph cur_node pred_flow in
        if Fact.compare new_output (Graph.find_fact graph cur_node) = 0 then
          graph_iter graph rem_nodes
        else
          let add_graph = Graph.add_fact cur_node new_output graph in
          let cur_succ = Graph.NodeS.elements (Graph.succs graph cur_node) in
          let add_nodes = List.fold_left (fun n elt -> [elt] @ n) rem_nodes cur_succ in
          (* Printf.printf "# loops\n"; *)
          graph_iter add_graph add_nodes
        end in
      let final = graph_iter g worklist_nodes in
      (* Printf.printf "%s\n" (Graph.to_string final); *)
      final
  end
