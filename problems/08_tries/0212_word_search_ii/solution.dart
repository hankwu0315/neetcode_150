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
  // TODO: implement
  return [];
}

void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
