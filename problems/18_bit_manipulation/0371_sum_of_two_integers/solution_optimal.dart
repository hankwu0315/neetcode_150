// 0371. Sum of Two Integers
int getSum(int a, int b) {
  while (b != 0) {
    final carry = (a & b) << 1;
    a = a ^ b;
    b = carry;
  }
  return a;
}
void main() {
  if (getSum(1, 2) != 3) throw 'a';
  if (getSum(2, 3) != 5) throw 'b';
  if (getSum(-1, 1) != 0) throw 'c';
  if (getSum(-2, 3) != 1) throw 'd';
  if (getSum(0, 0) != 0) throw 'e';
  if (getSum(-5, -7) != -12) throw 'f';
  print('All tests passed!');
}
