// 0073. Set Matrix Zeroes
void setZeroes(List<List<int>> m) {
  final mm = m.length, nn = m[0].length;
  var firstRow = false, firstCol = false;
  for (var j = 0; j < nn; j++) if (m[0][j] == 0) firstRow = true;
  for (var i = 0; i < mm; i++) if (m[i][0] == 0) firstCol = true;
  for (var i = 1; i < mm; i++) {
    for (var j = 1; j < nn; j++) {
      if (m[i][j] == 0) { m[i][0] = 0; m[0][j] = 0; }
    }
  }
  for (var i = 1; i < mm; i++) {
    for (var j = 1; j < nn; j++) {
      if (m[i][0] == 0 || m[0][j] == 0) m[i][j] = 0;
    }
  }
  if (firstRow) for (var j = 0; j < nn; j++) m[0][j] = 0;
  if (firstCol) for (var i = 0; i < mm; i++) m[i][0] = 0;
}
bool eq(List<List<int>> a, List<List<int>> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i].length != b[i].length) return false;
    for (var j = 0; j < a[i].length; j++) if (a[i][j] != b[i][j]) return false;
  }
  return true;
}
void main() {
  final m1 = [[1, 1, 1], [1, 0, 1], [1, 1, 1]];
  setZeroes(m1);
  if (!eq(m1, [[1, 0, 1], [0, 0, 0], [1, 0, 1]])) throw 'a';
  final m2 = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]];
  setZeroes(m2);
  if (!eq(m2, [[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]])) throw 'b';
  final m3 = [[1]];
  setZeroes(m3);
  if (!eq(m3, [[1]])) throw 'c';
  print('All tests passed!');
}
