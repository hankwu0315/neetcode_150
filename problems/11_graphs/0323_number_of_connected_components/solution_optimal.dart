// Problem: 0323. Number of Connected Components in an Undirected Graph
// Difficulty: Medium

int countComponents(int n, List<List<int>> edges) {
  final parent = List<int>.generate(n, (i) => i);
  int find(int x) {
    while (parent[x] != x) {
      parent[x] = parent[parent[x]];
      x = parent[x];
    }
    return x;
  }
  var comps = n;
  for (final e in edges) {
    final ra = find(e[0]), rb = find(e[1]);
    if (ra != rb) { parent[ra] = rb; comps--; }
  }
  return comps;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(countComponents(5, [[0, 1], [1, 2], [3, 4]]), 2, 'a');
  _expect(countComponents(5, [[0, 1], [1, 2], [2, 3], [3, 4]]), 1, 'b');
  _expect(countComponents(4, []), 4, 'c');
  _expect(countComponents(1, []), 1, 'd');
  _expect(countComponents(6, [[0, 1], [2, 3], [4, 5]]), 3, 'e');
  _expect(countComponents(4, [[0, 1], [1, 2], [0, 2]]), 2, 'f');
  print('All tests passed!');
}
