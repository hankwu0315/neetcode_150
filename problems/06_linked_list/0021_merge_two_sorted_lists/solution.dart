// Problem: 0021. Merge Two Sorted Lists
// Difficulty: Easy

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? fromList(List<int> a) {
  final d = ListNode();
  var c = d;
  for (final v in a) { c.next = ListNode(v); c = c.next!; }
  return d.next;
}

List<int> toList(ListNode? h) {
  final out = <int>[];
  while (h != null) { out.add(h.val); h = h.next; }
  return out;
}

ListNode? mergeTwoLists(ListNode? l1, ListNode? l2) {
  final d = ListNode();
  var t = d;
  var a = l1, b = l2;
  while (a != null && b != null) {
    if (a.val <= b.val) { t.next = a; a = a.next; } else { t.next = b; b = b.next; }
    t = t.next!;
  }
  t.next = a ?? b;
  return d.next;
}

void _expect(List<int> a, List<int> e, String msg) {
  if (a.length != e.length || !List.generate(a.length, (i) => a[i] == e[i]).every((x) => x)) {
    throw StateError('FAIL $msg');
  }
}

void main() {
  _expect(toList(mergeTwoLists(fromList([1, 2, 4]), fromList([1, 3, 4]))), [1, 1, 2, 3, 4, 4], 'ex1');
  _expect(toList(mergeTwoLists(fromList([]), fromList([]))), [], 'empty');
  _expect(toList(mergeTwoLists(fromList([]), fromList([0]))), [0], 'left empty');
  _expect(toList(mergeTwoLists(fromList([5]), fromList([1, 2, 3]))), [1, 2, 3, 5], 'tail');
  print('All tests passed!');
}
