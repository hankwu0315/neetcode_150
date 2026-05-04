// Problem: 0295. Find Median from Data Stream
// Difficulty: Hard

class _MaxHeap {
  final List<int> a = [];
  int get size => a.length;
  int get top => a[0];
  void push(int x) {
    a.add(x);
    var i = a.length - 1;
    while (i > 0) {
      final p = (i - 1) >> 1;
      if (a[p] >= a[i]) break;
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
        if (l < n && a[l] > a[m]) m = l;
        if (r < n && a[r] > a[m]) m = r;
        if (m == i) break;
        final t = a[i]; a[i] = a[m]; a[m] = t;
        i = m;
      }
    }
    return t0;
  }
}

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

class MedianFinder {
  final _MaxHeap lo = _MaxHeap();
  final _MinHeap hi = _MinHeap();

  void addNum(int num) {
    lo.push(num);
    hi.push(lo.pop());
    if (hi.size > lo.size) lo.push(hi.pop());
  }

  double findMedian() {
    if (lo.size > hi.size) return lo.top.toDouble();
    return (lo.top + hi.top) / 2.0;
  }
}

void _expectD(double a, double e, String msg) {
  if ((a - e).abs() > 1e-9) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  final mf = MedianFinder();
  mf.addNum(1); mf.addNum(2);
  _expectD(mf.findMedian(), 1.5, 'a');
  mf.addNum(3);
  _expectD(mf.findMedian(), 2.0, 'b');
  final mf2 = MedianFinder();
  for (final x in [-1, -2, -3, -4, -5]) mf2.addNum(x);
  _expectD(mf2.findMedian(), -3.0, 'c');
  final mf3 = MedianFinder();
  mf3.addNum(6); _expectD(mf3.findMedian(), 6.0, 'd1');
  mf3.addNum(10); _expectD(mf3.findMedian(), 8.0, 'd2');
  mf3.addNum(2); mf3.addNum(6);
  _expectD(mf3.findMedian(), 6.0, 'd3');
  mf3.addNum(5); mf3.addNum(0);
  _expectD(mf3.findMedian(), 5.5, 'd4');
  print('All tests passed!');
}
