// Problem: 0207. Course Schedule
// Difficulty: Medium

import 'dart:collection';

bool canFinish(int numCourses, List<List<int>> prerequisites) {
  final g = List.generate(numCourses, (_) => <int>[]);
  final indeg = List<int>.filled(numCourses, 0);
  for (final p in prerequisites) {
    g[p[1]].add(p[0]);
    indeg[p[0]]++;
  }
  final q = Queue<int>();
  for (var i = 0; i < numCourses; i++) if (indeg[i] == 0) q.add(i);
  var done = 0;
  while (q.isNotEmpty) {
    final u = q.removeFirst();
    done++;
    for (final v in g[u]) {
      indeg[v]--;
      if (indeg[v] == 0) q.add(v);
    }
  }
  return done == numCourses;
}

void _expect(bool a, bool e, String msg) {
  if (a != e) throw StateError('FAIL $msg');
}

void main() {
  _expect(canFinish(2, [[1, 0]]), true, 'a');
  _expect(canFinish(2, [[1, 0], [0, 1]]), false, 'b');
  _expect(canFinish(1, []), true, 'c');
  _expect(canFinish(4, [[1, 0], [2, 1], [3, 2]]), true, 'd');
  _expect(canFinish(3, [[0, 1], [1, 2], [2, 0]]), false, 'e');
  _expect(canFinish(5, []), true, 'f');
  print('All tests passed!');
}
