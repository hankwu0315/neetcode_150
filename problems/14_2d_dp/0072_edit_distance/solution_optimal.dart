// 0072. Edit Distance
import 'dart:math';
int minDistance(String w1, String w2) {
  final m = w1.length, n = w2.length;
  var prev = List<int>.generate(n + 1, (i) => i);
  for (var i = 1; i <= m; i++) {
    final cur = List<int>.filled(n + 1, 0);
    cur[0] = i;
    for (var j = 1; j <= n; j++) {
      if (w1[i - 1] == w2[j - 1]) {
        cur[j] = prev[j - 1];
      } else {
        cur[j] = 1 + min(prev[j - 1], min(prev[j], cur[j - 1]));
      }
    }
    prev = cur;
  }
  return prev[n];
}
void main() {
  if (minDistance("horse", "ros") != 3) throw 'a';
  if (minDistance("intention", "execution") != 5) throw 'b';
  if (minDistance("", "") != 0) throw 'c';
  if (minDistance("a", "") != 1) throw 'd';
  if (minDistance("", "abc") != 3) throw 'e';
  if (minDistance("abc", "abc") != 0) throw 'f';
  print('All tests passed!');
}
