// Problem: 0210. Course Schedule II
// Difficulty: Medium

import 'dart:collection';

List<int> findOrder(int numCourses, List<List<int>> prerequisites) {
  final g = List.generate(numCourses, (_) => <int>[]);
  final indeg = List<int>.filled(numCourses, 0);
  for (final p in prerequisites) {
    g[p[1]].add(p[0]);
    indeg[p[0]]++;
  }
  final q = Queue<int>();
  for (var i = 0; i < numCourses; i++) if (indeg[i] == 0) q.add(i);
  final order = <int>[];
  while (q.isNotEmpty) {
    final u = q.removeFirst();
    order.add(u);
    for (final v in g[u]) {
      indeg[v]--;
      if (indeg[v] == 0) q.add(v);
    }
  }
  return order.length == numCourses ? order : <int>[];
}

bool _validOrder(List<int> order, int n, List<List<int>> prereqs) {
  if (order.length != n) return false;
  final seen = <int>{};
  for (final v in order) seen.add(v);
  if (seen.length != n) return false;
  final pos = <int, int>{};
  for (var i = 0; i < order.length; i++) pos[order[i]] = i;
  for (final p in prereqs) {
    if ((pos[p[1]] ?? -1) > (pos[p[0]] ?? -1)) return false;
  }
  return true;
}

void main() {
  final p1 = [[1, 0]]; if (!_validOrder(findOrder(2, p1), 2, p1)) throw 'a';
  final p2 = [[1, 0], [2, 0], [3, 1], [3, 2]];
  if (!_validOrder(findOrder(4, p2), 4, p2)) throw 'b';
  if (findOrder(2, [[1, 0], [0, 1]]).isNotEmpty) throw 'c';
  final List<List<int>> p3 = [];
  if (!_validOrder(findOrder(3, p3), 3, p3)) throw 'd';
  final r5 = findOrder(1, []); if (!(r5.length == 1 && r5[0] == 0)) throw 'e';
  if (findOrder(3, [[0, 1], [1, 2], [2, 0]]).isNotEmpty) throw 'f';
  print('All tests passed!');
}
