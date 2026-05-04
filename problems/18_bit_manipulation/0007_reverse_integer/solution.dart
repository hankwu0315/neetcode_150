// 0007. Reverse Integer
int reverseInteger(int x) {
  final sign = x < 0 ? -1 : 1;
  var n = x.abs();
  var r = 0;
  while (n > 0) {
    r = r * 10 + n % 10;
    n ~/= 10;
  }
  r *= sign;
  if (r < -2147483648 || r > 2147483647) return 0;
  return r;
}
void main() {
  if (reverseInteger(123) != 321) throw 'a';
  if (reverseInteger(-123) != -321) throw 'b';
  if (reverseInteger(120) != 21) throw 'c';
  if (reverseInteger(0) != 0) throw 'd';
  if (reverseInteger(1534236469) != 0) throw 'e';
  print('All tests passed!');
}
