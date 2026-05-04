// Problem: 0206. Reverse Linked List
// Difficulty: Easy

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? fromList(List<int> a) {
  final d = ListNode();
  var c = d;
  for (final v in a) {
    c.next = ListNode(v);
    c = c.next!;
  }
  return d.next;
}

List<int> toList(ListNode? h) {
  final out = <int>[];
  while (h != null) {
    out.add(h.val);
    h = h.next;
  }
  return out;
}

ListNode? reverseList(ListNode? head) {
  ListNode? prev;
  var cur = head;
  while (cur != null) {
    final nxt = cur.next;
    cur.next = prev;
    prev = cur;
    cur = nxt;
  }
  return prev;
}

void _expect(List<int> a, List<int> e, String msg) {
  if (a.length != e.length || !List.generate(a.length, (i) => a[i] == e[i]).every((x) => x)) {
    throw StateError('FAIL $msg: $a vs $e');
  }
}

void main() {
  _expect(toList(reverseList(fromList([1, 2, 3, 4, 5]))), [5, 4, 3, 2, 1], 'ex1');
  _expect(toList(reverseList(fromList([1, 2]))), [2, 1], 'ex2');
  _expect(toList(reverseList(fromList([]))), [], 'empty');
  _expect(toList(reverseList(fromList([7]))), [7], 'single');
  print('All tests passed!');
}
