// 0746. Min Cost Climbing Stairs
import 'dart:math';
int minCostClimbingStairs(List<int> cost) {
  var a = 0, b = 0;
  for (var i = 2; i <= cost.length; i++) {
    final c = min(b + cost[i - 1], a + cost[i - 2]);
    a = b; b = c;
  }
  return b;
}
void main() {
  if (minCostClimbingStairs([10, 15, 20]) != 15) throw 'a';
  if (minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]) != 6) throw 'b';
  if (minCostClimbingStairs([0, 0]) != 0) throw 'c';
  if (minCostClimbingStairs([1, 2]) != 1) throw 'd';
  if (minCostClimbingStairs([10, 15]) != 10) throw 'e';
  if (minCostClimbingStairs([0, 1, 2, 2]) != 2) throw 'f';
  print('All tests passed!');
}
