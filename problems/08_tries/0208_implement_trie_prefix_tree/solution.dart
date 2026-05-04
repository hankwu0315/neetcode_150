// Problem: 0208. Implement Trie (Prefix Tree)
// Difficulty: Medium

class _Node {
  final Map<String, _Node> ch = {};
  bool end = false;
}

class Trie {
  final _Node root = _Node();
  void insert(String word) {
    // TODO: implement
  }
  _Node? _walk(String s) {
    // TODO: implement
    return null;
  }
  bool search(String w) {
    // TODO: implement
    return false;
  }
  bool startsWith(String p) {
    // TODO: implement
    return false;
  }
}


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
