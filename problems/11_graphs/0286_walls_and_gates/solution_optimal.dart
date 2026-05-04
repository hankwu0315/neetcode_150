// Problem: 0286. Walls and Gates
// Difficulty: Medium

import 'dart:collection';

const int INF = 2147483647;

void wallsAndGates(List<List<int>> rooms) {
  if (rooms.isEmpty || rooms[0].isEmpty) return;
  final m = rooms.length, n = rooms[0].length;
  final q = Queue<List<int>>();
  for (var i = 0; i < m; i++) {
    for (var j = 0; j < n; j++) {
      if (rooms[i][j] == 0) q.add([i, j]);
    }
  }
  const dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]];
  while (q.isNotEmpty) {
    final p = q.removeFirst();
    for (final d in dirs) {
      final ni = p[0] + d[0], nj = p[1] + d[1];
      if (ni >= 0 && ni < m && nj >= 0 && nj < n && rooms[ni][nj] == INF) {
        rooms[ni][nj] = rooms[p[0]][p[1]] + 1;
        q.add([ni, nj]);
      }
    }
  }
}

bool _eqGrid(List<List<int>> a, List<List<int>> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i].length != b[i].length) return false;
    for (var j = 0; j < a[i].length; j++) if (a[i][j] != b[i][j]) return false;
  }
  return true;
}

void main() {
  final r = [
    [INF, -1, 0, INF],
    [INF, INF, INF, -1],
    [INF, -1, INF, -1],
    [0, -1, INF, INF],
  ];
  wallsAndGates(r);
  if (!_eqGrid(r, [
    [3, -1, 0, 1],
    [2, 2, 1, -1],
    [1, -1, 2, -1],
    [0, -1, 3, 4],
  ])) throw 'a';
  final r2 = [[0]]; wallsAndGates(r2); if (!_eqGrid(r2, [[0]])) throw 'b';
  final r3 = [[INF]]; wallsAndGates(r3); if (!_eqGrid(r3, [[INF]])) throw 'c';
  final r4 = [[-1, INF, 0]]; wallsAndGates(r4); if (!_eqGrid(r4, [[-1, 1, 0]])) throw 'd';
  final List<List<int>> r5 = []; wallsAndGates(r5); if (r5.isNotEmpty) throw 'e';
  print('All tests passed!');
}
