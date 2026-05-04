// Problem: 0141. Linked List Cycle
// Difficulty: Easy

class ListNode {
  int val; ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? buildWithCycle(List<int> a, int pos) {
  if (a.isEmpty) return null;
  final nodes = a.map((v) => ListNode(v)).toList();
  for (var i = 0; i < nodes.length - 1; i++) nodes[i].next = nodes[i + 1];
  if (pos != -1) nodes.last.next = nodes[pos];
  return nodes[0];
}

bool hasCycle(ListNode? head) {
  var slow = head, fast = head;
  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
    if (identical(slow, fast)) return true;
  }
  return false;
}

void _expect(bool a, bool e, String msg) {
  if (a != e) throw StateError('FAIL $msg');
}

void main() {
  _expect(hasCycle(buildWithCycle([3, 2, 0, -4], 1)), true, 'ex1');
  _expect(hasCycle(buildWithCycle([1, 2], 0)), true, 'ex2');
  _expect(hasCycle(buildWithCycle([1], -1)), false, 'one');
  _expect(hasCycle(buildWithCycle([], -1)), false, 'empty');
  _expect(hasCycle(buildWithCycle([1, 2, 3], -1)), false, 'no cycle');
  print('All tests passed!');
}
