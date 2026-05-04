// 1143. Longest Common Subsequence
import 'dart:math';
int longestCommonSubsequence(String t1, String t2) {
  final m = t1.length, n = t2.length;
  var prev = List<int>.filled(n + 1, 0);
  for (var i = 1; i <= m; i++) {
    final cur = List<int>.filled(n + 1, 0);
    for (var j = 1; j <= n; j++) {
      if (t1[i - 1] == t2[j - 1]) {
        cur[j] = prev[j - 1] + 1;
      } else {
        cur[j] = max(prev[j], cur[j - 1]);
      }
    }
    prev = cur;
  }
  return prev[n];
}
void main() {
  if (longestCommonSubsequence("abcde", "ace") != 3) throw 'a';
  if (longestCommonSubsequence("abc", "abc") != 3) throw 'b';
  if (longestCommonSubsequence("abc", "def") != 0) throw 'c';
  if (longestCommonSubsequence("", "abc") != 0) throw 'd';
  if (longestCommonSubsequence("bsbininm", "jmjkbkjkv") != 1) throw 'e';
  if (longestCommonSubsequence("ezupkr", "ubmrapg") != 2) throw 'f';
  print('All tests passed!');
}
