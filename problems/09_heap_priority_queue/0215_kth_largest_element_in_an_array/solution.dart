// Problem: 0215. Kth Largest Element in an Array
// Difficulty: Medium

class _MinHeap {
  final List<int> a = [];
  int get size => a.length;
  int get top => a[0];
  void push(int x) {
    a.add(x);
    var i = a.length - 1;
    while (i > 0) {
      final p = (i - 1) >> 1;
      if (a[p] <= a[i]) break;
      final t = a[p]; a[p] = a[i]; a[i] = t;
      i = p;
    }
  }
  int pop() {
    final t0 = a[0];
    final last = a.removeLast();
    if (a.isNotEmpty) {
      a[0] = last;
      var i = 0; final n = a.length;
      while (true) {
        final l = 2 * i + 1, r = 2 * i + 2;
        var m = i;
        if (l < n && a[l] < a[m]) m = l;
        if (r < n && a[r] < a[m]) m = r;
        if (m == i) break;
        final t = a[i]; a[i] = a[m]; a[m] = t;
        i = m;
      }
    }
    return t0;
  }
}

int findKthLargest(List<int> nums, int k) {
  final h = _MinHeap();
  for (final x in nums) {
    if (h.size < k) h.push(x);
    else if (x > h.top) { h.pop(); h.push(x); }
  }
  return h.top;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(findKthLargest([3, 2, 1, 5, 6, 4], 2), 5, 'ex1');
  _expect(findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4), 4, 'ex2');
  _expect(findKthLargest([1], 1), 1, 'one');
  _expect(findKthLargest([1, 2], 2), 1, 'two');
  _expect(findKthLargest([7, 7, 7], 2), 7, 'dup');
  _expect(findKthLargest([-1, -2, -3], 3), -3, 'neg');
  print('All tests passed!');
}
