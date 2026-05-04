// 0139. Word Break
bool wordBreak(String s, List<String> wordDict) {
  final words = wordDict.toSet();
  var maxW = 0;
  for (final w in words) if (w.length > maxW) maxW = w.length;
  final n = s.length;
  final dp = List<bool>.filled(n + 1, false);
  dp[0] = true;
  for (var i = 1; i <= n; i++) {
    final lo = i - maxW < 0 ? 0 : i - maxW;
    for (var j = lo; j < i; j++) {
      if (dp[j] && words.contains(s.substring(j, i))) { dp[i] = true; break; }
    }
  }
  return dp[n];
}
void main() {
  if (wordBreak("leetcode", ["leet", "code"]) != true) throw 'a';
  if (wordBreak("applepenapple", ["apple", "pen"]) != true) throw 'b';
  if (wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]) != false) throw 'c';
  if (wordBreak("a", ["a"]) != true) throw 'd';
  if (wordBreak("ab", ["a"]) != false) throw 'e';
  if (wordBreak("aaaaaaa", ["aaaa", "aaa"]) != true) throw 'f';
  print('All tests passed!');
}
