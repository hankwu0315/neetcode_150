// Problem: 0695. Max Area of Island
// Difficulty: Medium

int maxAreaOfIsland(List<List<int>> grid) {
  if (grid.isEmpty || grid[0].isEmpty) return 0;
  final m = grid.length, n = grid[0].length;
  int dfs(int i, int j) {
    if (i < 0 || i >= m || j < 0 || j >= n || grid[i][j] != 1) return 0;
    grid[i][j] = 0;
    return 1 + dfs(i + 1, j) + dfs(i - 1, j) + dfs(i, j + 1) + dfs(i, j - 1);
  }
  var best = 0;
  for (var i = 0; i < m; i++) {
    for (var j = 0; j < n; j++) {
      if (grid[i][j] == 1) {
        final a = dfs(i, j);
        if (a > best) best = a;
      }
    }
  }
  return best;
}

List<List<int>> _copy(List<List<int>> g) =>
    g.map((r) => List<int>.from(r)).toList();

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  final g1 = [
    [0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
    [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
    [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0],
  ];
  _expect(maxAreaOfIsland(_copy(g1)), 6, 'a');
  _expect(maxAreaOfIsland([[0, 0, 0, 0, 0, 0, 0, 0]]), 0, 'b');
  _expect(maxAreaOfIsland([[1]]), 1, 'c');
  _expect(maxAreaOfIsland([[1, 1], [1, 1]]), 4, 'd');
  _expect(maxAreaOfIsland([[0, 1, 0], [1, 1, 1], [0, 1, 0]]), 5, 'e');
  print('All tests passed!');
}
