// Problem: 0130. Surrounded Regions
// Difficulty: Medium

void solve(List<List<String>> board) {
  if (board.isEmpty || board[0].isEmpty) return;
  final m = board.length, n = board[0].length;
  void dfs(int i, int j) {
    if (i < 0 || i >= m || j < 0 || j >= n || board[i][j] != 'O') return;
    board[i][j] = '#';
    dfs(i + 1, j); dfs(i - 1, j); dfs(i, j + 1); dfs(i, j - 1);
  }
  for (var i = 0; i < m; i++) { dfs(i, 0); dfs(i, n - 1); }
  for (var j = 0; j < n; j++) { dfs(0, j); dfs(m - 1, j); }
  for (var i = 0; i < m; i++) {
    for (var j = 0; j < n; j++) {
      if (board[i][j] == 'O') board[i][j] = 'X';
      else if (board[i][j] == '#') board[i][j] = 'O';
    }
  }
}

List<List<String>> _g(List<String> rows) =>
    rows.map((r) => r.split('')).toList();

bool _eqG(List<List<String>> a, List<List<String>> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i].length != b[i].length) return false;
    for (var j = 0; j < a[i].length; j++) if (a[i][j] != b[i][j]) return false;
  }
  return true;
}

void main() {
  final b = _g(["XXXX", "XOOX", "XXOX", "XOXX"]);
  solve(b);
  if (!_eqG(b, _g(["XXXX", "XXXX", "XXXX", "XOXX"]))) throw 'a';
  final b2 = _g(["X"]); solve(b2); if (!_eqG(b2, _g(["X"]))) throw 'b';
  final b3 = _g(["OO", "OO"]); solve(b3); if (!_eqG(b3, _g(["OO", "OO"]))) throw 'c';
  final b4 = _g(["XXX", "XOX", "XXX"]); solve(b4); if (!_eqG(b4, _g(["XXX", "XXX", "XXX"]))) throw 'd';
  final b5 = _g(["OXXO", "XOOX", "XOOX", "OXXO"]); solve(b5);
  if (!_eqG(b5, _g(["OXXO", "XXXX", "XXXX", "OXXO"]))) throw 'e';
  print('All tests passed!');
}
