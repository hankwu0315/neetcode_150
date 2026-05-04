// 0416. Partition Equal Subset Sum
bool canPartition(List<int> nums) {
  var s = 0;
  for (final x in nums) s += x;
  if (s.isOdd) return false;
  final target = s ~/ 2;
  final dp = List<bool>.filled(target + 1, false);
  dp[0] = true;
  for (final x in nums) {
    for (var v = target; v >= x; v--) {
      if (dp[v - x]) dp[v] = true;
    }
  }
  return dp[target];
}
void main() {
  if (canPartition([1, 5, 11, 5]) != true) throw 'a';
  if (canPartition([1, 2, 3, 5]) != false) throw 'b';
  if (canPartition([1, 1]) != true) throw 'c';
  if (canPartition([2, 2, 1, 1]) != true) throw 'd';
  if (canPartition([1]) != false) throw 'e';
  if (canPartition([100, 100, 100, 100, 100, 100, 100, 100]) != true) throw 'f';
  print('All tests passed!');
}
