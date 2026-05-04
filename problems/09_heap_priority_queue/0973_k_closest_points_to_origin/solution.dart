// Problem: 0973. K Closest Points to Origin
// Difficulty: Medium

class _MaxHeap {
  // entries: [dist, x, y]
  final List<List<int>> a = [];
  int get size => a.length;
  int topD() => a[0][0];
  void push(List<int> e) {
    a.add(e);
    var i = a.length - 1;
    while (i > 0) {
      final p = (i - 1) >> 1;
      if (a[p][0] >= a[i][0]) break;
      final t = a[p]; a[p] = a[i]; a[i] = t;
      i = p;
    }
  }
  List<int> pop() {
    final top = a[0];
    final last = a.removeLast();
    if (a.isNotEmpty) {
      a[0] = last;
      var i = 0; final n = a.length;
      while (true) {
        final l = 2 * i + 1, r = 2 * i + 2;
        var m = i;
        if (l < n && a[l][0] > a[m][0]) m = l;
        if (r < n && a[r][0] > a[m][0]) m = r;
        if (m == i) break;
        final t = a[i]; a[i] = a[m]; a[m] = t;
        i = m;
      }
    }
    return top;
  }
}

List<List<int>> kClosest(List<List<int>> points, int k) {
  final h = _MaxHeap();
  for (final p in points) {
    final d = p[0] * p[0] + p[1] * p[1];
    if (h.size < k) {
      h.push([d, p[0], p[1]]);
    } else if (d < h.topD()) {
      h.pop();
      h.push([d, p[0], p[1]]);
    }
  }
  return h.a.map((e) => [e[1], e[2]]).toList();
}

List<List<int>> _norm(List<List<int>> a) {
  final s = a.map((p) => [p[0], p[1]]).toList();
  s.sort((x, y) {
    if (x[0] != y[0]) return x[0].compareTo(y[0]);
    return x[1].compareTo(y[1]);
  });
  return s;
}

bool _eq(List<List<int>> a, List<List<int>> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i][0] != b[i][0] || a[i][1] != b[i][1]) return false;
  }
  return true;
}

void main() {
  if (!_eq(_norm(kClosest([[1, 3], [-2, 2]], 1)), _norm([[-2, 2]]))) throw 'ex1';
  if (!_eq(_norm(kClosest([[3, 3], [5, -1], [-2, 4]], 2)), _norm([[3, 3], [-2, 4]]))) throw 'ex2';
  if (!_eq(_norm(kClosest([[1, 1]], 1)), _norm([[1, 1]]))) throw 'ex3';
  if (!_eq(_norm(kClosest([[0, 1], [1, 0]], 2)), _norm([[0, 1], [1, 0]]))) throw 'ex4';
  if (!_eq(_norm(kClosest([[2, 2], [2, 2], [3, 3]], 2)), _norm([[2, 2], [2, 2]]))) throw 'ex5';
  print('All tests passed!');
}
