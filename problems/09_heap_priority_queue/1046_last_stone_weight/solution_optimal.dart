// Problem: 1046. Last Stone Weight
// Difficulty: Easy

class _MaxHeap {
  final List<int> a = [];
  int get size => a.length;
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
    final top = a[0];
    final last = a.removeLast();
    if (a.isNotEmpty) {
      a[0] = last;
      var i = 0;
      final n = a.length;
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
    return top;
  }
}

int lastStoneWeight(List<int> stones) {
  final h = _MaxHeap();
  for (final s in stones) h.push(s);
  while (h.size > 1) {
    final x = h.pop();
    final y = h.pop();
    if (x != y) h.push(x - y);
  }
  return h.size == 0 ? 0 : h.a[0];
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(lastStoneWeight([2, 7, 4, 1, 8, 1]), 1, 'ex1');
  _expect(lastStoneWeight([1]), 1, 'one');
  _expect(lastStoneWeight([2, 2]), 0, 'pair');
  _expect(lastStoneWeight([3, 7, 2]), 2, '3,7,2');
  _expect(lastStoneWeight([10]), 10, '10');
  print('All tests passed!');
}
