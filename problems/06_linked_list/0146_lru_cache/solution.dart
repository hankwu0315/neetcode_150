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
    head.next = tail;
    tail.prev = head;
  }

  void _remove(_Node n) {
    n.prev!.next = n.next;
    n.next!.prev = n.prev;
  }

  void _addFront(_Node n) {
    n.prev = head;
    n.next = head.next;
    head.next!.prev = n;
    head.next = n;
  }

  int get(int key) {
    final n = map[key];
    if (n == null) return -1;
    _remove(n); _addFront(n);
    return n.val;
  }

  void put(int key, int value) {
    if (map.containsKey(key)) {
      final n = map[key]!;
      n.val = value;
      _remove(n); _addFront(n);
      return;
    }
    final n = _Node(key, value);
    map[key] = n;
    _addFront(n);
    if (map.length > cap) {
      final lru = tail.prev!;
      _remove(lru);
      map.remove(lru.key);
    }
  }
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  final c = LRUCache(2);
  c.put(1, 1); c.put(2, 2);
  _expect(c.get(1), 1, 'g1');
  c.put(3, 3); _expect(c.get(2), -1, 'evict 2');
  c.put(4, 4); _expect(c.get(1), -1, 'evict 1');
  _expect(c.get(3), 3, 'g3');
  _expect(c.get(4), 4, 'g4');

  final c2 = LRUCache(2);
  c2.put(1, 1); c2.put(2, 2);
  c2.put(1, 10); _expect(c2.get(1), 10, 'update');
  c2.put(3, 3); _expect(c2.get(2), -1, 'evict old');
  _expect(c2.get(1), 10, 'still 1');
  print('All tests passed!');
}
