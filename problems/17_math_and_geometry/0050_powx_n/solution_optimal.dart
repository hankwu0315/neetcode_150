// 0050. Pow(x, n)
double myPow(double x, int n) {
  var nn = n;
  var b = x;
  if (nn < 0) { b = 1 / b; nn = -nn; }
  var res = 1.0;
  while (nn > 0) {
    if (nn & 1 == 1) res *= b;
    b *= b;
    nn >>= 1;
  }
  return res;
}
void main() {
  if ((myPow(2.0, 10) - 1024.0).abs() > 1e-6) throw 'a';
  if ((myPow(2.1, 3) - 9.261).abs() > 1e-6) throw 'b';
  if ((myPow(2.0, -2) - 0.25).abs() > 1e-6) throw 'c';
  if ((myPow(1.0, 0) - 1.0).abs() > 1e-6) throw 'd';
  if ((myPow(0.5, 4) - 0.0625).abs() > 1e-6) throw 'e';
  print('All tests passed!');
}
