// Problem: 0211. Design Add and Search Words Data Structure
// Difficulty: Medium

class _Node {
  final Map<String, _Node> ch = {};
  bool end = false;
}

class WordDictionary {
  final _Node root = _Node();
  void addWord(String word) {
    var n = root;
    for (var i = 0; i < word.length; i++) {
      n = n.ch.putIfAbsent(word[i], () => _Node());
    }
    n.end = true;
  }
  bool search(String word) {
    bool dfs(int i, _Node n) {
      if (i == word.length) return n.end;
      final c = word[i];
      if (c == '.') {
        for (final nxt in n.ch.values) {
          if (dfs(i + 1, nxt)) return true;
        }
        return false;
      }
      final nxt = n.ch[c];
      return nxt != null && dfs(i + 1, nxt);
    }
    return dfs(0, root);
  }
}

void _expect(bool a, bool e, String msg) {
  if (a != e) throw StateError('FAIL $msg');
}

void main() {
  final w = WordDictionary();
  w.addWord('bad'); w.addWord('dad'); w.addWord('mad');
  _expect(w.search('pad'), false, 'pad');
  _expect(w.search('bad'), true, 'bad');
  _expect(w.search('.ad'), true, '.ad');
  _expect(w.search('b..'), true, 'b..');
  _expect(w.search('b...'), false, 'b...');
  w.addWord('a');
  _expect(w.search('a'), true, 'a');
  _expect(w.search('.'), true, '.');
  _expect(w.search('aa'), false, 'aa');
  print('All tests passed!');
}
