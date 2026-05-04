// Problem: 0138. Copy List with Random Pointer
// Difficulty: Medium

class RNode {
  int val;
  RNode? next;
  RNode? random;
  RNode(this.val);
}

RNode? build(List<List<int?>> arr) {
  if (arr.isEmpty) return null;
  final nodes = arr.map((p) => RNode(p[0]!)).toList();
  for (var i = 0; i < nodes.length - 1; i++) nodes[i].next = nodes[i + 1];
  for (var i = 0; i < arr.length; i++) {
    final r = arr[i][1];
    if (r != null) nodes[i].random = nodes[r];
  }
  return nodes[0];
}

List<List<int?>> serialize(RNode? h) {
  final nodes = <RNode>[];
  final idx = <RNode, int>{};
  var c = h;
  while (c != null) { idx[c] = nodes.length; nodes.add(c); c = c.next; }
  return nodes.map((n) => <int?>[n.val, n.random == null ? null : idx[n.random!]]).toList();
}

RNode? copyRandomList(RNode? head) {
  if (head == null) return null;
  final m = <RNode, RNode>{};
  var c = head;
  while (true) {
    m[c] = RNode(c.val);
    if (c.next == null) break;
    c = c.next!;
  }
  var cur = head;
  while (true) {
    final n = m[cur]!;
    n.next = cur.next == null ? null : m[cur.next!];
    n.random = cur.random == null ? null : m[cur.random!];
    if (cur.next == null) break;
    cur = cur.next!;
  }
  return m[head];
}

bool _eq(List<List<int?>> a, List<List<int?>> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i][0] != b[i][0] || a[i][1] != b[i][1]) return false;
  }
  return true;
}

void main() {
  final cases = <List<List<int?>>>[
    [[7, null], [13, 0], [11, 4], [10, 2], [1, 0]],
    [[1, 1], [2, 1]],
    [[3, null], [3, 0], [3, null]],
    [],
  ];
  for (final arr in cases) {
    final h = build(arr);
    final c = copyRandomList(h);
    if (!_eq(serialize(c), arr)) throw StateError('FAIL serialize');
  }
  print('All tests passed!');
}
