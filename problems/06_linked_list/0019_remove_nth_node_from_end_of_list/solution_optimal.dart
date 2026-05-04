// Problem: 0019. Remove Nth Node From End of List
// Difficulty: Medium

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

ListNode? removeNthFromEnd(ListNode? head, int n) {
  final dummy = ListNode(0, head);
  ListNode? fast = dummy, slow = dummy;
  for (var i = 0; i < n + 1; i++) fast = fast!.next;
  while (fast != null) { fast = fast.next; slow = slow!.next; }
  slow!.next = slow.next!.next;
  return dummy.next;
}

void _expect(List<int> a, List<int> e, String msg) {
  if (a.length != e.length || !List.generate(a.length, (i) => a[i] == e[i]).every((x) => x)) {
    throw StateError('FAIL $msg');
  }
}

void main() {
  _expect(toList(removeNthFromEnd(fromList([1, 2, 3, 4, 5]), 2)), [1, 2, 3, 5], 'ex1');
  _expect(toList(removeNthFromEnd(fromList([1]), 1)), [], 'one');
  _expect(toList(removeNthFromEnd(fromList([1, 2]), 1)), [1], 'tail');
  _expect(toList(removeNthFromEnd(fromList([1, 2]), 2)), [2], 'head');
  _expect(toList(removeNthFromEnd(fromList([1, 2, 3, 4, 5]), 5)), [2, 3, 4, 5], 'head5');
  _expect(toList(removeNthFromEnd(fromList([1, 2, 3, 4, 5]), 1)), [1, 2, 3, 4], 'tail5');
  print('All tests passed!');
}
