// 0213. House Robber II

import 'dart:math';

int _linear(List<int> a, int lo, int hi) {
  var p2 = 0, p1 = 0;
  for (var i = lo; i < hi; i++) {
    final cur = max(p1, p2 + a[i]);
    p2 = p1; p1 = cur;
  }
  return p1;
}

int rob(List<int> nums) {
  // TODO: implement
  return 0;
}

void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
