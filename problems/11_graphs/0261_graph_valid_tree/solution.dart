// Problem: 0261. Graph Valid Tree
// Difficulty: Medium

bool validTree(int n, List<List<int>> edges) {
  if (edges.length != n - 1) return false;
  final parent = List<int>.generate(n, (i) => i);
  int find(int x) {
    while (parent[x] != x) {
      parent[x] = parent[parent[x]];
      x = parent[x];
    }
    return x;
  }
  for (final e in edges) {
    final ra = find(e[0]), rb = find(e[1]);
    if (ra == rb) return false;
    parent[ra] = rb;
  }
  return true;
}

void _expect(bool a, bool e, String msg) {
  if (a != e) throw StateError('FAIL $msg');
}

void main() {
  _expect(validTree(5, [[0, 1], [0, 2], [0, 3], [1, 4]]), true, 'a');
  _expect(validTree(5, [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]]), false, 'b');
  _expect(validTree(1, []), true, 'c');
  _expect(validTree(2, [[0, 1]]), true, 'd');
  _expect(validTree(4, [[0, 1], [2, 3]]), false, 'e');
  _expect(validTree(3, [[0, 1], [0, 2], [1, 2]]), false, 'f');
  print('All tests passed!');
}
