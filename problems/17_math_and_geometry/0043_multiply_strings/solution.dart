// 0043. Multiply Strings
String multiplyStrings(String num1, String num2) {
  if (num1 == '0' || num2 == '0') return '0';
  final m = num1.length, n = num2.length;
  final buf = List<int>.filled(m + n, 0);
  for (var i = m - 1; i >= 0; i--) {
    final a = num1.codeUnitAt(i) - 48;
    for (var j = n - 1; j >= 0; j--) {
      final b = num2.codeUnitAt(j) - 48;
      final p = buf[i + j + 1] + a * b;
      buf[i + j + 1] = p % 10;
      buf[i + j] += p ~/ 10;
    }
  }
  final sb = StringBuffer();
  var leading = true;
  for (final d in buf) {
    if (leading && d == 0) continue;
    leading = false;
    sb.write(d);
  }
  final s = sb.toString();
  return s.isEmpty ? '0' : s;
}
void main() {
  if (multiplyStrings('2', '3') != '6') throw 'a';
  if (multiplyStrings('123', '456') != '56088') throw 'b';
  if (multiplyStrings('0', '12345') != '0') throw 'c';
  if (multiplyStrings('999', '999') != '998001') throw 'd';
  if (multiplyStrings('1', '1') != '1') throw 'e';
  print('All tests passed!');
}
