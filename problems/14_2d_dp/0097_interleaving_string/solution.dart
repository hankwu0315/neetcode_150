// 0097. Interleaving String
bool isInterleave(String s1, String s2, String s3) {
  final m = s1.length, n = s2.length;
  if (m + n != s3.length) return false;
  final dp = List<bool>.filled(n + 1, false);
  dp[0] = true;
  for (var j = 1; j <= n; j++) dp[j] = dp[j - 1] && s2[j - 1] == s3[j - 1];
  for (var i = 1; i <= m; i++) {
    dp[0] = dp[0] && s1[i - 1] == s3[i - 1];
    for (var j = 1; j <= n; j++) {
      dp[j] = (dp[j] && s1[i - 1] == s3[i + j - 1]) ||
              (dp[j - 1] && s2[j - 1] == s3[i + j - 1]);
    }
  }
  return dp[n];
}
void main() {
  if (isInterleave("aabcc", "dbbca", "aadbbcbcac") != true) throw 'a';
  if (isInterleave("aabcc", "dbbca", "aadbbbaccc") != false) throw 'b';
  if (isInterleave("", "", "") != true) throw 'c';
  if (isInterleave("", "abc", "abc") != true) throw 'd';
  if (isInterleave("a", "", "a") != true) throw 'e';
  if (isInterleave("a", "b", "ab") != true) throw 'f';
  if (isInterleave("a", "b", "ba") != true) throw 'g';
  print('All tests passed!');
}
