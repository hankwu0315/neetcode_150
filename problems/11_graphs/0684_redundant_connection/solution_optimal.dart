// Problem: 0684. Redundant Connection
// Difficulty: Medium

List<int> findRedundantConnection(List<List<int>> edges) {
  final n = edges.length;
  final parent = List<int>.generate(n + 1, (i) => i);
  int find(int x) {
    while (parent[x] != x) {
      parent[x] = parent[parent[x]];
      x = parent[x];
    }
    return x;
  }
  for (final e in edges) {
    final ra = find(e[0]), rb = find(e[1]);
    if (ra == rb) return [e[0], e[1]];
    parent[ra] = rb;
  }
  return [];
}

bool _eq(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) if (a[i] != b[i]) return false;
  return true;
}

void main() {
  if (!_eq(findRedundantConnection([[1, 2], [1, 3], [2, 3]]), [2, 3])) throw 'a';
  if (!_eq(findRedundantConnection([[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]]), [1, 4])) throw 'b';
  if (!_eq(findRedundantConnection([[1, 2], [2, 3], [3, 1]]), [3, 1])) throw 'c';
  if (!_eq(findRedundantConnection([[2, 1], [3, 1], [4, 2], [1, 4]]), [1, 4])) throw 'd';
  if (!_eq(findRedundantConnection([[1, 2], [1, 3], [3, 2]]), [3, 2])) throw 'e';
  print('All tests passed!');
}
