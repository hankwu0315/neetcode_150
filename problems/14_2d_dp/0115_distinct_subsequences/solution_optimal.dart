// 0115. Distinct Subsequences
int numDistinct(String s, String t) {
  final m = s.length, n = t.length;
  if (n > m) return 0;
  final dp = List<int>.filled(n + 1, 0);
  dp[0] = 1;
  for (var i = 1; i <= m; i++) {
    final hi = i < n ? i : n;
    for (var j = hi; j >= 1; j--) {
      if (s[i - 1] == t[j - 1]) dp[j] += dp[j - 1];
    }
  }
  return dp[n];
}
void main() {
  if (numDistinct("rabbbit", "rabbit") != 3) throw 'a';
  if (numDistinct("babgbag", "bag") != 5) throw 'b';
  if (numDistinct("", "") != 1) throw 'c';
  if (numDistinct("a", "a") != 1) throw 'd';
  if (numDistinct("a", "b") != 0) throw 'e';
  if (numDistinct("aaa", "a") != 3) throw 'f';
  print('All tests passed!');
}
