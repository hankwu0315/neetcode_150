// Problem: 0208. Implement Trie (Prefix Tree)
// Difficulty: Medium

class _Node {
  final Map<String, _Node> ch = {};
  bool end = false;
}

class Trie {
  final _Node root = _Node();
  void insert(String word) {
    var n = root;
    for (var i = 0; i < word.length; i++) {
      final c = word[i];
      n = n.ch.putIfAbsent(c, () => _Node());
    }
    n.end = true;
  }
  _Node? _walk(String s) {
    var n = root;
    for (var i = 0; i < s.length; i++) {
      final next = n.ch[s[i]];
      if (next == null) return null;
      n = next;
    }
    return n;
  }
  bool search(String w) {
    final n = _walk(w);
    return n != null && n.end;
  }
  bool startsWith(String p) => _walk(p) != null;
}

void _expect(bool a, bool e, String msg) {
  if (a != e) throw StateError('FAIL $msg');
}

void main() {
  final t = Trie();
  t.insert('apple');
  _expect(t.search('apple'), true, 'apple in');
  _expect(t.search('app'), false, 'app not in');
  _expect(t.startsWith('app'), true, 'app prefix');
  t.insert('app');
  _expect(t.search('app'), true, 'app now in');
  _expect(t.startsWith('appl'), true, 'appl prefix');
  _expect(t.search('appl'), false, 'appl not word');
  _expect(t.startsWith('b'), false, 'b not prefix');
  print('All tests passed!');
}
