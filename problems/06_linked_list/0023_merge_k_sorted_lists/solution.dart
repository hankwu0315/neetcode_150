// Problem: 0023. Merge K Sorted Lists
// Difficulty: Hard
// 分治兩兩合併。O(N log k)。

class ListNode {
  int val; ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? fromList(List<int> a) {
  // TODO: implement
  return null;
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
  // TODO: implement
  return null;
}


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
