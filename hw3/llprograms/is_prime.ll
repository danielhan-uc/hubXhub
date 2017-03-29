global list = int[] {3, 5, 7, 8, 11, 15, 17, 21};

bool isPrime (int n) {
  if (n < 2) {
    return false;
  }

  for (var i = 2; i <= num / 2; i = i + 1)
  {
    var cur_num = n;
    while (cur_num > i) {
      cur_num = cur_num - i;
    }

    if (cur_num == 0) {
      return false;
    }
  }
  return true;
}

int program (int argc, string[] argv) {
  var answer = isPrime(list[0]);
  return answer;  
}
