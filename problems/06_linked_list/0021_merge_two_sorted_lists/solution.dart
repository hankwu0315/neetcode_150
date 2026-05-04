// Problem: 0021. Merge Two Sorted Lists
// Difficulty: Easy

class ListNode {
  int val;
  ListNode? next;
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

ListNode? mergeTwoLists(ListNode? l1, ListNode? l2) {
  // TODO: implement
  return null;
}


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
