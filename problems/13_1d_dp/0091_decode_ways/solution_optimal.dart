// 0091. Decode Ways
int numDecodings(String s) {
  final n = s.length;
  if (n == 0 || s[0] == '0') return 0;
  var p2 = 1, p1 = 1;
  for (var i = 2; i <= n; i++) {
    var cur = 0;
    if (s[i - 1] != '0') cur += p1;
    final two = int.parse(s.substring(i - 2, i));
    if (two >= 10 && two <= 26) cur += p2;
    p2 = p1; p1 = cur;
  }
  return p1;
}
void main() {
  if (numDecodings("12") != 2) throw 'a';
  if (numDecodings("226") != 3) throw 'b';
  if (numDecodings("06") != 0) throw 'c';
  if (numDecodings("0") != 0) throw 'd';
  if (numDecodings("10") != 1) throw 'e';
  if (numDecodings("27") != 1) throw 'f';
  if (numDecodings("11106") != 2) throw 'g';
  print('All tests passed!');
}
