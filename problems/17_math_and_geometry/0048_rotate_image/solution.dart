// 0048. Rotate Image
void rotate(List<List<int>> m) {
  final n = m.length;
  for (var i = 0; i < n; i++) {
    for (var j = i + 1; j < n; j++) {
      final t = m[i][j]; m[i][j] = m[j][i]; m[j][i] = t;
    }
  }
  for (final row in m) {
    for (var i = 0, j = n - 1; i < j; i++, j--) {
      final t = row[i]; row[i] = row[j]; row[j] = t;
    }
  }
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
  final m1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
  rotate(m1);
  if (!eq(m1, [[7, 4, 1], [8, 5, 2], [9, 6, 3]])) throw 'a';
  final m2 = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]];
  rotate(m2);
  if (!eq(m2, [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]])) throw 'b';
  final m3 = [[1]]; rotate(m3);
  if (!eq(m3, [[1]])) throw 'c';
  print('All tests passed!');
}
