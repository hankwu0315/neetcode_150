// Problem: 0743. Network Delay Time
// Difficulty: Medium

class _MinHeap {
  final List<List<int>> _a = [];
  bool get isEmpty => _a.isEmpty;
  void push(List<int> v) { _a.add(v); _siftUp(_a.length - 1); }
  List<int> pop() {
    final top = _a[0];
    final last = _a.removeLast();
    if (_a.isNotEmpty) { _a[0] = last; _siftDown(0); }
    return top;
  }
  void _siftUp(int i) {
    while (i > 0) {
      final p = (i - 1) >> 1;
      if (_a[p][0] <= _a[i][0]) break;
      final t = _a[i]; _a[i] = _a[p]; _a[p] = t; i = p;
    }
  }
  void _siftDown(int i) {
    final n = _a.length;
    while (true) {
      final l = 2 * i + 1, r = 2 * i + 2;
      var s = i;
      if (l < n && _a[l][0] < _a[s][0]) s = l;
      if (r < n && _a[r][0] < _a[s][0]) s = r;
      if (s == i) break;
      final t = _a[i]; _a[i] = _a[s]; _a[s] = t; i = s;
    }
  }
}

const int INF743 = 0x3FFFFFFFFFFFFFFF;

int networkDelayTime(List<List<int>> times, int n, int k) {
  final g = List.generate(n + 1, (_) => <List<int>>[]);
  for (final t in times) g[t[0]].add([t[1], t[2]]);
  final dist = List<int>.filled(n + 1, INF743);
  dist[k] = 0;
  final h = _MinHeap()..push([0, k]);
  while (!h.isEmpty) {
    final p = h.pop();
    final d = p[0], u = p[1];
    if (d > dist[u]) continue;
    for (final e in g[u]) {
      final nd = d + e[1];
      if (nd < dist[e[0]]) { dist[e[0]] = nd; h.push([nd, e[0]]); }
    }
  }
  var ans = 0;
  for (var i = 1; i <= n; i++) if (dist[i] > ans) ans = dist[i];
  return ans == INF743 ? -1 : ans;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(networkDelayTime([[2, 1, 1], [2, 3, 1], [3, 4, 1]], 4, 2), 2, 'a');
  _expect(networkDelayTime([[1, 2, 1]], 2, 1), 1, 'b');
  _expect(networkDelayTime([[1, 2, 1]], 2, 2), -1, 'c');
  _expect(networkDelayTime([[1, 2, 1], [2, 1, 3]], 2, 2), 3, 'd');
  _expect(networkDelayTime([[1, 2, 1], [2, 3, 2], [1, 3, 4]], 3, 1), 3, 'e');
  _expect(networkDelayTime([], 1, 1), 0, 'f');
  print('All tests passed!');
}
