// 0518. Coin Change II
int change(int amount, List<int> coins) {
  final dp = List<int>.filled(amount + 1, 0);
  dp[0] = 1;
  for (final c in coins) {
    for (var a = c; a <= amount; a++) dp[a] += dp[a - c];
  }
  return dp[amount];
}
void main() {
  if (change(5, [1, 2, 5]) != 4) throw 'a';
  if (change(3, [2]) != 0) throw 'b';
  if (change(10, [10]) != 1) throw 'c';
  if (change(0, [1, 2]) != 1) throw 'd';
  if (change(500, [1, 2, 5]) != 12701) throw 'e';
  if (change(7, [1, 5, 10]) != 2) throw 'f';
  print('All tests passed!');
}
