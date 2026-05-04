// 0338. Counting Bits
List<int> countBits(int n) {
  final dp = List<int>.filled(n + 1, 0);
  for (var i = 1; i <= n; i++) dp[i] = dp[i >> 1] + (i & 1);
  return dp;
}
bool eq(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) if (a[i] != b[i]) return false;
  return true;
}
void main() {
  if (!eq(countBits(2), [0, 1, 1])) throw 'a';
  if (!eq(countBits(5), [0, 1, 1, 2, 1, 2])) throw 'b';
  if (!eq(countBits(0), [0])) throw 'c';
  if (!eq(countBits(8), [0, 1, 1, 2, 1, 2, 2, 3, 1])) throw 'd';
  print('All tests passed!');
}
