// 0066. Plus One
List<int> plusOne(List<int> digits) {
  final d = [...digits];
  var i = d.length - 1;
  while (i >= 0) {
    if (d[i] < 9) { d[i]++; return d; }
    d[i] = 0; i--;
  }
  return [1, ...d];
}
bool eq(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) if (a[i] != b[i]) return false;
  return true;
}
void main() {
  if (!eq(plusOne([1, 2, 3]), [1, 2, 4])) throw 'a';
  if (!eq(plusOne([4, 3, 2, 1]), [4, 3, 2, 2])) throw 'b';
  if (!eq(plusOne([9]), [1, 0])) throw 'c';
  if (!eq(plusOne([9, 9, 9]), [1, 0, 0, 0])) throw 'd';
  if (!eq(plusOne([0]), [1])) throw 'e';
  print('All tests passed!');
}
