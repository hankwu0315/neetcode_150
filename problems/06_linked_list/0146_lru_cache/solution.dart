// Problem: 0146. LRU Cache
// Difficulty: Medium

class _Node {
  int key, val;
  _Node? prev, next;
  _Node([this.key = 0, this.val = 0]);
}

class LRUCache {
  final int cap;
  final Map<int, _Node> map = {};
  final _Node head = _Node();
  final _Node tail = _Node();

  LRUCache(this.cap) {
    // TODO: implement
  }

  void _remove(_Node n) {
    // TODO: implement
  }

  void _addFront(_Node n) {
    // TODO: implement
  }

  int get(int key) {
    // TODO: implement
    return 0;
  }

  void put(int key, int value) {
    // TODO: implement
  }
}


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
