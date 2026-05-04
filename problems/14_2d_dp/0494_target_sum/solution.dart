// 0494. Target Sum
int findTargetSumWays(List<int> nums, int target) {
  var s = 0;
  for (final x in nums) s += x;
  if (target.abs() > s || (s + target).isOdd) return 0;
  final p = (s + target) ~/ 2;
  final dp = List<int>.filled(p + 1, 0);
  dp[0] = 1;
  for (final x in nums) {
    for (var v = p; v >= x; v--) dp[v] += dp[v - x];
  }
  return dp[p];
}
void main() {
  if (findTargetSumWays([1, 1, 1, 1, 1], 3) != 5) throw 'a';
  if (findTargetSumWays([1], 1) != 1) throw 'b';
  if (findTargetSumWays([1], 2) != 0) throw 'c';
  if (findTargetSumWays([0, 0, 0, 0, 0, 0, 0, 0, 1], 1) != 256) throw 'd';
  if (findTargetSumWays([1, 2, 3], 0) != 2) throw 'e';
  if (findTargetSumWays([100], -200) != 0) throw 'f';
  print('All tests passed!');
}
