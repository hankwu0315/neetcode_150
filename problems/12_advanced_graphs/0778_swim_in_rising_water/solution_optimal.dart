// Problem: 0778. Swim in Rising Water
// Difficulty: Hard

class _MinHeap {
  final List<List<int>> _a = [];
  bool get isEmpty => _a.isEmpty;
  void push(List<int> v) { _a.add(v); _up(_a.length - 1); }
  List<int> pop() {
    final t = _a[0]; final l = _a.removeLast();
    if (_a.isNotEmpty) { _a[0] = l; _down(0); }
    return t;
  }
  void _up(int i) {
    while (i > 0) {
      final p = (i - 1) >> 1;
      if (_a[p][0] <= _a[i][0]) break;
      final t = _a[i]; _a[i] = _a[p]; _a[p] = t; i = p;
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
      final t = _a[i]; _a[i] = _a[s]; _a[s] = t; i = s;
    }
  }
}

int swimInWater(List<List<int>> grid) {
  final n = grid.length;
  final vis = List.generate(n, (_) => List<bool>.filled(n, false));
  final h = _MinHeap()..push([grid[0][0], 0, 0]);
  const dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]];
  while (!h.isEmpty) {
    final p = h.pop();
    final t = p[0], i = p[1], j = p[2];
    if (i == n - 1 && j == n - 1) return t;
    if (vis[i][j]) continue;
    vis[i][j] = true;
    for (final d in dirs) {
      final ni = i + d[0], nj = j + d[1];
      if (ni >= 0 && ni < n && nj >= 0 && nj < n && !vis[ni][nj]) {
        final nt = t > grid[ni][nj] ? t : grid[ni][nj];
        h.push([nt, ni, nj]);
      }
    }
  }
  return -1;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(swimInWater([[0, 2], [1, 3]]), 3, 'a');
  _expect(swimInWater([
    [0, 1, 2, 3, 4],
    [24, 23, 22, 21, 5],
    [12, 13, 14, 15, 16],
    [11, 17, 18, 19, 20],
    [10, 9, 8, 7, 6],
  ]), 16, 'b');
  _expect(swimInWater([[0]]), 0, 'c');
  _expect(swimInWater([[0, 1], [2, 3]]), 3, 'd');
  _expect(swimInWater([[3, 2], [0, 1]]), 3, 'e');
  _expect(swimInWater([[10, 12], [20, 15]]), 15, 'f');
  print('All tests passed!');
}
