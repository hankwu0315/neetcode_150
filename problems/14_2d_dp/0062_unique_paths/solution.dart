// 0062. Unique Paths
int uniquePaths(int m, int n) {
  final dp = List<int>.filled(n, 1);
  for (var i = 1; i < m; i++) {
    for (var j = 1; j < n; j++) dp[j] += dp[j - 1];
  }
  return dp[n - 1];
}
void main() {
  if (uniquePaths(3, 7) != 28) throw 'a';
  if (uniquePaths(3, 2) != 3) throw 'b';
  if (uniquePaths(7, 3) != 28) throw 'c';
  if (uniquePaths(1, 1) != 1) throw 'd';
  if (uniquePaths(1, 10) != 1) throw 'e';
  if (uniquePaths(10, 10) != 48620) throw 'f';
  print('All tests passed!');
}
