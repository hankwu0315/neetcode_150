// Problem: 0143. Reorder List
// Difficulty: Medium

class ListNode {
  int val;
  ListNode? next;
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

void reorderList(ListNode? head) {
  if (head == null || head.next == null) return;
  var slow = head, fast = head;
  while (fast.next != null && fast.next!.next != null) {
    slow = slow.next!;
    fast = fast.next!.next!;
  }
  var second = slow.next;
  slow.next = null;
  ListNode? prev;
  while (second != null) {
    final nxt = second.next;
    second.next = prev;
    prev = second;
    second = nxt;
  }
  ListNode? a = head, b = prev;
  while (b != null) {
    final aN = a!.next, bN = b.next;
    a.next = b;
    b.next = aN;
    a = aN; b = bN;
  }
}

void _expect(List<int> a, List<int> e, String msg) {
  if (a.length != e.length || !List.generate(a.length, (i) => a[i] == e[i]).every((x) => x)) {
    throw StateError('FAIL $msg: $a vs $e');
  }
}

void main() {
  var h = fromList([1, 2, 3, 4]); reorderList(h); _expect(toList(h), [1, 4, 2, 3], 'ex1');
  h = fromList([1, 2, 3, 4, 5]); reorderList(h); _expect(toList(h), [1, 5, 2, 4, 3], 'ex2');
  h = fromList([1]); reorderList(h); _expect(toList(h), [1], 'one');
  h = fromList([1, 2]); reorderList(h); _expect(toList(h), [1, 2], 'two');
  h = fromList([1, 2, 3]); reorderList(h); _expect(toList(h), [1, 3, 2], 'three');
  print('All tests passed!');
}
