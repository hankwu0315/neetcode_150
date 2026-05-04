// Problem: 0019. Remove Nth Node From End of List
// Difficulty: Medium

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

ListNode? removeNthFromEnd(ListNode? head, int n) {
  // TODO: implement
  return null;
}


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
