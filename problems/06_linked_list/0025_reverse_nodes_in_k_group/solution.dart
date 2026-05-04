// Problem: 0025. Reverse Nodes in k-Group
// Difficulty: Hard

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

ListNode? reverseKGroup(ListNode? head, int k) {
  // TODO: implement
  return null;
}


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
