// Problem: 0417. Pacific Atlantic Water Flow
// Difficulty: Medium

List<List<int>> pacificAtlantic(List<List<int>> heights) {
  if (heights.isEmpty || heights[0].isEmpty) return [];
  final m = heights.length, n = heights[0].length;
  final pac = List.generate(m, (_) => List<bool>.filled(n, false));
  final atl = List.generate(m, (_) => List<bool>.filled(n, false));
  void dfs(int i, int j, List<List<bool>> vis) {
    vis[i][j] = true;
    const dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]];
    for (final d in dirs) {
      final ni = i + d[0], nj = j + d[1];
      if (ni >= 0 && ni < m && nj >= 0 && nj < n &&
          !vis[ni][nj] && heights[ni][nj] >= heights[i][j]) {
        dfs(ni, nj, vis);
      }
    }
  }
  for (var i = 0; i < m; i++) { dfs(i, 0, pac); dfs(i, n - 1, atl); }
  for (var j = 0; j < n; j++) { dfs(0, j, pac); dfs(m - 1, j, atl); }
  final res = <List<int>>[];
  for (var i = 0; i < m; i++) {
    for (var j = 0; j < n; j++) {
      if (pac[i][j] && atl[i][j]) res.add([i, j]);
    }
  }
  return res;
}

List<List<int>> _norm(List<List<int>> a) {
  final c = a.map((r) => List<int>.from(r)).toList();
  c.sort((x, y) {
    if (x[0] != y[0]) return x[0] - y[0];
    return x[1] - y[1];
  });
  return c;
}

bool _eq(List<List<int>> a, List<List<int>> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i].length != b[i].length) return false;
    for (var j = 0; j < a[i].length; j++) if (a[i][j] != b[i][j]) return false;
  }
  return true;
}

void main() {
  final h1 = [
    [1, 2, 2, 3, 5],
    [3, 2, 3, 4, 4],
    [2, 4, 5, 3, 1],
    [6, 7, 1, 4, 5],
    [5, 1, 1, 2, 4],
  ];
  final exp1 = [[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]];
  if (!_eq(_norm(pacificAtlantic(h1)), _norm(exp1))) throw 'a';
  if (!_eq(pacificAtlantic([[1]]), [[0, 0]])) throw 'b';
  if (!_eq(_norm(pacificAtlantic([[1, 1], [1, 1]])),
      _norm([[0, 0], [0, 1], [1, 0], [1, 1]]))) throw 'c';
  if (pacificAtlantic([]).isNotEmpty) throw 'd';
  final h2 = [[3, 3, 3], [3, 1, 3], [0, 3, 3]];
  final exp2 = [[0, 0], [0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1], [2, 2]];
  if (!_eq(_norm(pacificAtlantic(h2)), _norm(exp2))) throw 'e';
  print('All tests passed!');
}
