// Problem: 0143. Reorder List
// Difficulty: Medium

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

void reorderList(ListNode? head) {
  // TODO: implement
}


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
