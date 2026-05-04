// Problem: 0994. Rotting Oranges
// Difficulty: Medium

import 'dart:collection';

int orangesRotting(List<List<int>> grid) {
  if (grid.isEmpty || grid[0].isEmpty) return 0;
  final m = grid.length, n = grid[0].length;
  final q = Queue<List<int>>();
  var fresh = 0;
  for (var i = 0; i < m; i++) {
    for (var j = 0; j < n; j++) {
      if (grid[i][j] == 2) q.add([i, j]);
      else if (grid[i][j] == 1) fresh++;
    }
  }
  if (fresh == 0) return 0;
  var mins = 0;
  const dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]];
  while (q.isNotEmpty) {
    var spread = false;
    final sz = q.length;
    for (var k = 0; k < sz; k++) {
      final p = q.removeFirst();
      for (final d in dirs) {
        final ni = p[0] + d[0], nj = p[1] + d[1];
        if (ni >= 0 && ni < m && nj >= 0 && nj < n && grid[ni][nj] == 1) {
          grid[ni][nj] = 2;
          fresh--;
          q.add([ni, nj]);
          spread = true;
        }
      }
    }
    if (spread) mins++;
  }
  return fresh == 0 ? mins : -1;
}

List<List<int>> _copy(List<List<int>> g) =>
    g.map((r) => List<int>.from(r)).toList();

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(orangesRotting(_copy([[2, 1, 1], [1, 1, 0], [0, 1, 1]])), 4, 'a');
  _expect(orangesRotting(_copy([[2, 1, 1], [0, 1, 1], [1, 0, 1]])), -1, 'b');
  _expect(orangesRotting(_copy([[0, 2]])), 0, 'c');
  _expect(orangesRotting(_copy([[0]])), 0, 'd');
  _expect(orangesRotting(_copy([[1]])), -1, 'e');
  _expect(orangesRotting(_copy([[2, 2], [1, 1], [0, 0], [2, 0]])), 1, 'f');
  print('All tests passed!');
}
