// Problem: 0703. Kth Largest Element in a Stream
// Difficulty: Easy

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
    final top = a[0];
    final last = a.removeLast();
    if (a.isNotEmpty) {
      a[0] = last;
      var i = 0, n = a.length;
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
    return top;
  }
}

class KthLargest {
  final int k;
  final _MinHeap h = _MinHeap();
  KthLargest(this.k, List<int> nums) {
    for (final n in nums) add(n);
  }
  int add(int val) {
    if (h.size < k) {
      h.push(val);
    } else if (val > h.top) {
      h.pop(); h.push(val);
    }
    return h.top;
  }
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  final kl = KthLargest(3, [4, 5, 8, 2]);
  _expect(kl.add(3), 4, 'add 3');
  _expect(kl.add(5), 5, 'add 5');
  _expect(kl.add(10), 5, 'add 10');
  _expect(kl.add(9), 8, 'add 9');
  _expect(kl.add(4), 8, 'add 4');
  print('All tests passed!');
}
