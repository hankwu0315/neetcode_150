// Problem: 0703. Kth Largest Element in a Stream
// Difficulty: Easy

class _MinHeap {
  final List<int> a = [];
  int get size => a.length;
  int get top => a[0];
  void push(int x) {
    // TODO: implement
  }
  int pop() {
    // TODO: implement
    return 0;
  }
}

class KthLargest {
  final int k;
  final _MinHeap h = _MinHeap();
  KthLargest(this.k, List<int> nums) {
    // TODO: implement
  }
  int add(int val) {
    // TODO: implement
    return 0;
  }
}


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
