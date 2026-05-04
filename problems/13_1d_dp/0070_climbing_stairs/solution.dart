// 0070. Climbing Stairs

int climbStairs(int n) {
  var a = 1, b = 1;
  for (var i = 0; i < n; i++) {
    final t = a + b;
    a = b;
    b = t;
  }
  return a;
}

void main() {
  if (climbStairs(1) != 1) throw 'a';
  if (climbStairs(2) != 2) throw 'b';
  if (climbStairs(3) != 3) throw 'c';
  if (climbStairs(5) != 8) throw 'd';
  if (climbStairs(10) != 89) throw 'e';
  if (climbStairs(0) != 1) throw 'f';
  print('All tests passed!');
}
