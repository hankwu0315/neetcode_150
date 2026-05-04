// Problem: 1584. Min Cost to Connect All Points
// Difficulty: Medium

class _MinHeap {
  final List<List<int>> _a = [];
  bool get isEmpty => _a.isEmpty;
  void push(List<int> v) { _a.add(v); _up(_a.length - 1); }
  List<int> pop() {
    final t = _a[0];
    final l = _a.removeLast();
    if (_a.isNotEmpty) { _a[0] = l; _down(0); }
    return t;
  }
  void _up(int i) {
    while (i > 0) {
      final p = (i - 1) >> 1;
      if (_a[p][0] <= _a[i][0]) break;
      final tmp = _a[i]; _a[i] = _a[p]; _a[p] = tmp; i = p;
    }
  }
  void _down(int i) {
    final n = _a.length;
    while (true) {
      final l = 2 * i + 1, r = 2 * i + 2;
      var s = i;
      if (l < n && _a[l][0] < _a[s][0]) s = l;
      if (r < n && _a[r][0] < _a[s][0]) s = r;
      if (s == i) break;
      final tmp = _a[i]; _a[i] = _a[s]; _a[s] = tmp; i = s;
    }
  }
}

int minCostConnectPoints(List<List<int>> points) {
  final n = points.length;
  if (n <= 1) return 0;
  final inMst = List<bool>.filled(n, false);
  final h = _MinHeap()..push([0, 0]);
  var total = 0, seen = 0;
  while (!h.isEmpty && seen < n) {
    final p = h.pop();
    final d = p[0], u = p[1];
    if (inMst[u]) continue;
    inMst[u] = true;
    total += d;
    seen++;
    for (var v = 0; v < n; v++) {
      if (!inMst[v]) {
        final nd = (points[u][0] - points[v][0]).abs() +
            (points[u][1] - points[v][1]).abs();
        h.push([nd, v]);
      }
    }
  }
  return total;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(minCostConnectPoints([[0, 0], [2, 2], [3, 10], [5, 2], [7, 0]]), 20, 'a');
  _expect(minCostConnectPoints([[3, 12], [-2, 5], [-4, 1]]), 18, 'b');
  _expect(minCostConnectPoints([[0, 0]]), 0, 'c');
  _expect(minCostConnectPoints([[0, 0], [1, 1]]), 2, 'd');
  _expect(minCostConnectPoints([[2, -3], [-17, -8], [13, 8], [-17, -15]]), 53, 'e');
  _expect(minCostConnectPoints([]), 0, 'f');
  print('All tests passed!');
}
