// Problem: 0002. Add Two Numbers
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

ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  final d = ListNode(); var t = d;
  var a = l1, b = l2; var c = 0;
  while (a != null || b != null || c > 0) {
    var s = c;
    if (a != null) { s += a.val; a = a.next; }
    if (b != null) { s += b.val; b = b.next; }
    c = s ~/ 10;
    t.next = ListNode(s % 10); t = t.next!;
  }
  return d.next;
}

void _expect(List<int> a, List<int> e, String msg) {
  if (a.length != e.length || !List.generate(a.length, (i) => a[i] == e[i]).every((x) => x)) {
    throw StateError('FAIL $msg: $a vs $e');
  }
}

void main() {
  _expect(toList(addTwoNumbers(fromList([2, 4, 3]), fromList([5, 6, 4]))), [7, 0, 8], 'ex1');
  _expect(toList(addTwoNumbers(fromList([0]), fromList([0]))), [0], 'zero');
  _expect(toList(addTwoNumbers(fromList([9, 9, 9, 9, 9, 9, 9]), fromList([9, 9, 9, 9]))), [8, 9, 9, 9, 0, 0, 0, 1], 'ex3');
  _expect(toList(addTwoNumbers(fromList([5]), fromList([5]))), [0, 1], 'carry');
  print('All tests passed!');
}
