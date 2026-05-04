// 0312. Burst Balloons
int maxCoins(List<int> nums) {
  final a = <int>[1, ...nums, 1];
  final n = a.length;
  final dp = List.generate(n, (_) => List<int>.filled(n, 0));
  for (var length = 2; length < n; length++) {
    for (var l = 0; l + length < n; l++) {
      final r = l + length;
      var best = 0;
      for (var k = l + 1; k < r; k++) {
        final v = dp[l][k] + dp[k][r] + a[l] * a[k] * a[r];
        if (v > best) best = v;
      }
      dp[l][r] = best;
    }
  }
  return dp[0][n - 1];
}
void main() {
  if (maxCoins([3, 1, 5, 8]) != 167) throw 'a';
  if (maxCoins([1, 5]) != 10) throw 'b';
  if (maxCoins([5]) != 5) throw 'c';
  if (maxCoins([]) != 0) throw 'd';
  if (maxCoins([1, 2, 3]) != 12) throw 'e';
  if (maxCoins([7, 9, 8, 0, 7, 1, 3, 5, 5, 2]) != 1582) throw 'f';
  print('All tests passed!');
}
