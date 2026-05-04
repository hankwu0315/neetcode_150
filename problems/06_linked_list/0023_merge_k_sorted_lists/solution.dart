// Problem: 0023. Merge K Sorted Lists
// Difficulty: Hard
// 分治兩兩合併。O(N log k)。

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

ListNode? _merge2(ListNode? a, ListNode? b) {
  final d = ListNode(); var t = d;
  while (a != null && b != null) {
    if (a.val <= b.val) { t.next = a; a = a.next; }
    else                { t.next = b; b = b.next; }
    t = t.next!;
  }
  t.next = a ?? b;
  return d.next;
}

ListNode? mergeKLists(List<ListNode?> lists) {
  if (lists.isEmpty) return null;
  var step = 1;
  final n = lists.length;
  while (step < n) {
    for (var i = 0; i + step < n; i += step * 2) {
      lists[i] = _merge2(lists[i], lists[i + step]);
    }
    step *= 2;
  }
  return lists[0];
}

void _expect(List<int> a, List<int> e, String msg) {
  if (a.length != e.length || !List.generate(a.length, (i) => a[i] == e[i]).every((x) => x)) {
    throw StateError('FAIL $msg: $a vs $e');
  }
}

void main() {
  _expect(toList(mergeKLists([fromList([1, 4, 5]), fromList([1, 3, 4]), fromList([2, 6])])),
      [1, 1, 2, 3, 4, 4, 5, 6], 'ex1');
  _expect(toList(mergeKLists([])), [], 'empty');
  _expect(toList(mergeKLists([fromList([])])), [], 'one empty');
  _expect(toList(mergeKLists([fromList([]), fromList([1])])), [1], 'mixed');
  _expect(toList(mergeKLists([fromList([1]), fromList([0])])), [0, 1], 'two');
  print('All tests passed!');
}
