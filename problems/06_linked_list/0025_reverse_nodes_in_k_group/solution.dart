// Problem: 0025. Reverse Nodes in k-Group
// Difficulty: Hard

class ListNode {
  int val; ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? fromList(List<int> a) {
  final d = ListNode(); var c = d;
  for (final v in a) { c.next = ListNode(v); c = c.next!; }
  return d.next;
}

List<int> toList(ListNode? h) {
  final out = <int>[];
  while (h != null) { out.add(h.val); h = h.next; }
  return out;
}

ListNode? reverseKGroup(ListNode? head, int k) {
  final dummy = ListNode(0, head);
  ListNode? groupPrev = dummy;
  while (true) {
    ListNode? kth = groupPrev;
    for (var i = 0; i < k; i++) {
      kth = kth!.next;
      if (kth == null) return dummy.next;
    }
    final groupNext = kth!.next;
    ListNode? prev = groupNext, cur = groupPrev!.next;
    while (cur != groupNext) {
      final nxt = cur!.next;
      cur.next = prev;
      prev = cur;
      cur = nxt;
    }
    final tmp = groupPrev.next;
    groupPrev.next = kth;
    groupPrev = tmp;
  }
}

void _expect(List<int> a, List<int> e, String msg) {
  if (a.length != e.length || !List.generate(a.length, (i) => a[i] == e[i]).every((x) => x)) {
    throw StateError('FAIL $msg: $a vs $e');
  }
}

void main() {
  _expect(toList(reverseKGroup(fromList([1, 2, 3, 4, 5]), 2)), [2, 1, 4, 3, 5], 'k2');
  _expect(toList(reverseKGroup(fromList([1, 2, 3, 4, 5]), 3)), [3, 2, 1, 4, 5], 'k3');
  _expect(toList(reverseKGroup(fromList([1, 2, 3, 4, 5, 6]), 3)), [3, 2, 1, 6, 5, 4], 'full2');
  _expect(toList(reverseKGroup(fromList([1, 2, 3, 4, 5]), 1)), [1, 2, 3, 4, 5], 'k1');
  _expect(toList(reverseKGroup(fromList([1, 2]), 5)), [1, 2], 'too short');
  _expect(toList(reverseKGroup(fromList([]), 2)), [], 'empty');
  print('All tests passed!');
}
