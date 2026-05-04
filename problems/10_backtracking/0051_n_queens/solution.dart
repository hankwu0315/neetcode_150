// Problem: 0051. N-Queens
// Difficulty: Hard

List<List<String>> solveNQueens(int n) {
  final out = <List<String>>[];
  final cols = <int>{}, d1 = <int>{}, d2 = <int>{};
  final placed = <int>[];
  void dfs(int r) {
    if (r == n) {
      final board = <String>[];
      for (final c in placed) {
        final row = List<String>.filled(n, '.');
        row[c] = 'Q';
        board.add(row.join());
      }
      out.add(board);
      return;
    }
    for (var c = 0; c < n; c++) {
      if (cols.contains(c) || d1.contains(r - c) || d2.contains(r + c)) continue;
      cols.add(c); d1.add(r - c); d2.add(r + c);
      placed.add(c);
      dfs(r + 1);
      placed.removeLast();
      cols.remove(c); d1.remove(r - c); d2.remove(r + c);
    }
  }
  dfs(0);
  return out;
}

bool _eqBoards(List<List<String>> a, List<List<String>> b) {
  if (a.length != b.length) return false;
  String key(List<String> bd) => bd.join('|');
  final sa = a.map(key).toList()..sort();
  final sb = b.map(key).toList()..sort();
  for (var i = 0; i < sa.length; i++) if (sa[i] != sb[i]) return false;
  return true;
}

void main() {
  if (!_eqBoards(solveNQueens(1), [["Q"]])) throw 'a';
  final r4 = solveNQueens(4);
  if (r4.length != 2) throw 'b1';
  if (!_eqBoards(r4, [
    [".Q..", "...Q", "Q...", "..Q."],
    ["..Q.", "Q...", "...Q", ".Q.."],
  ])) throw 'b2';
  if (solveNQueens(5).length != 10) throw 'c';
  if (solveNQueens(6).length != 4) throw 'd';
  if (solveNQueens(2).isNotEmpty) throw 'e';
  print('All tests passed!');
}
