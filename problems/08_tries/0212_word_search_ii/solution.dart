// Problem: 0212. Word Search II
// Difficulty: Hard

class _Node {
  final Map<String, _Node> ch = {};
  String? word;
}

_Node _build(List<String> words) {
  final root = _Node();
  for (final w in words) {
    var n = root;
    for (var i = 0; i < w.length; i++) {
      n = n.ch.putIfAbsent(w[i], () => _Node());
    }
    n.word = w;
  }
  return root;
}

List<String> findWords(List<List<String>> board, List<String> words) {
  if (board.isEmpty || board[0].isEmpty) return [];
  final root = _build(words);
  final m = board.length, n = board[0].length;
  final out = <String>[];
  void dfs(int r, int c, _Node node) {
    final ch = board[r][c];
    final nxt = node.ch[ch];
    if (nxt == null) return;
    if (nxt.word != null) {
      out.add(nxt.word!);
      nxt.word = null;
    }
    board[r][c] = '#';
    const dirs = [[-1, 0], [1, 0], [0, -1], [0, 1]];
    for (final d in dirs) {
      final nr = r + d[0], nc = c + d[1];
      if (nr >= 0 && nr < m && nc >= 0 && nc < n && board[nr][nc] != '#') {
        dfs(nr, nc, nxt);
      }
    }
    board[r][c] = ch;
    if (nxt.ch.isEmpty) node.ch.remove(ch);
  }
  for (var r = 0; r < m; r++) {
    for (var c = 0; c < n; c++) dfs(r, c, root);
  }
  return out;
}

void main() {
  final b1 = [
    ['o', 'a', 'a', 'n'],
    ['e', 't', 'a', 'e'],
    ['i', 'h', 'k', 'r'],
    ['i', 'f', 'l', 'v'],
  ];
  var r1 = findWords(b1, ['oath', 'pea', 'eat', 'rain']);
  r1.sort();
  if (r1.length != 2 || r1[0] != 'eat' || r1[1] != 'oath') throw 'ex1 $r1';

  final b2 = [['a', 'b'], ['c', 'd']];
  if (findWords(b2, ['abcb']).isNotEmpty) throw 'ex2';

  final b3 = [['a']];
  final r3 = findWords(b3, ['a']);
  if (r3.length != 1 || r3[0] != 'a') throw 'ex3';

  final b4 = [['a', 'a']];
  if (findWords(b4, ['aaa']).isNotEmpty) throw 'ex4';

  final b5 = [
    ['a', 'b', 'c'],
    ['a', 'e', 'd'],
    ['a', 'f', 'g'],
  ];
  final r5 = findWords(b5, ['abcdefg', 'befa', 'xyz']);
  r5.sort();
  if (!r5.contains('abcdefg') || !r5.contains('befa')) throw 'ex5 $r5';
  print('All tests passed!');
}
