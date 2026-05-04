// Problem: 0079. Word Search
// Difficulty: Medium

bool exist(List<List<String>> board, String word) {
  final m = board.length, n = board[0].length, L = word.length;
  bool dfs(int i, int j, int k) {
    if (k == L) return true;
    if (i < 0 || i >= m || j < 0 || j >= n || board[i][j] != word[k]) return false;
    final tmp = board[i][j];
    board[i][j] = '#';
    final ok = dfs(i + 1, j, k + 1) || dfs(i - 1, j, k + 1)
        || dfs(i, j + 1, k + 1) || dfs(i, j - 1, k + 1);
    board[i][j] = tmp;
    return ok;
  }
  for (var i = 0; i < m; i++) {
    for (var j = 0; j < n; j++) {
      if (board[i][j] == word[0] && dfs(i, j, 0)) return true;
    }
  }
  return false;
}

List<List<String>> _copy(List<List<String>> b) =>
    b.map((r) => List<String>.from(r)).toList();

void _expectB(bool a, bool e, String msg) {
  if (a != e) throw StateError('FAIL $msg');
}

void main() {
  final b1 = [
    ['A', 'B', 'C', 'E'],
    ['S', 'F', 'C', 'S'],
    ['A', 'D', 'E', 'E'],
  ];
  _expectB(exist(_copy(b1), "ABCCED"), true, 'a');
  _expectB(exist(_copy(b1), "SEE"), true, 'b');
  _expectB(exist(_copy(b1), "ABCB"), false, 'c');
  _expectB(exist([['A']], "A"), true, 'd');
  _expectB(exist([['A']], "B"), false, 'e');
  print('All tests passed!');
}
