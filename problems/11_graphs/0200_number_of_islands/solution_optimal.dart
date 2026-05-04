// Problem: 0200. Number of Islands
// Difficulty: Medium

int numIslands(List<List<String>> grid) {
  if (grid.isEmpty || grid[0].isEmpty) return 0;
  final m = grid.length, n = grid[0].length;
  void dfs(int i, int j) {
    if (i < 0 || i >= m || j < 0 || j >= n || grid[i][j] != '1') return;
    grid[i][j] = '0';
    dfs(i + 1, j); dfs(i - 1, j); dfs(i, j + 1); dfs(i, j - 1);
  }
  var cnt = 0;
  for (var i = 0; i < m; i++) {
    for (var j = 0; j < n; j++) {
      if (grid[i][j] == '1') { cnt++; dfs(i, j); }
    }
  }
  return cnt;
}

List<List<String>> _g(List<String> rows) =>
    rows.map((r) => r.split('')).toList();

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(numIslands(_g(["110", "100", "001"])), 2, 'a');
  _expect(numIslands(_g(["11110", "11010", "11000", "00000"])), 1, 'b');
  _expect(numIslands(_g(["11000", "11000", "00100", "00011"])), 3, 'c');
  _expect(numIslands([]), 0, 'd');
  _expect(numIslands(_g(["0"])), 0, 'e');
  _expect(numIslands(_g(["1"])), 1, 'f');
  print('All tests passed!');
}
