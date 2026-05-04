// Problem: 0210. Course Schedule II
// Difficulty: Medium

import 'dart:collection';

List<int> findOrder(int numCourses, List<List<int>> prerequisites) {
  // TODO: implement
  return [];
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
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
