// 0322. Coin Change
int coinChange(List<int> coins, int amount) {
  final INF = amount + 1;
  final dp = List<int>.filled(amount + 1, INF);
  dp[0] = 0;
  for (var a = 1; a <= amount; a++) {
    for (final c in coins) {
      if (c <= a && dp[a - c] + 1 < dp[a]) dp[a] = dp[a - c] + 1;
    }
  }
  return dp[amount] == INF ? -1 : dp[amount];
}
void main() {
  if (coinChange([1, 2, 5], 11) != 3) throw 'a';
  if (coinChange([2], 3) != -1) throw 'b';
  if (coinChange([1], 0) != 0) throw 'c';
  if (coinChange([1], 2) != 2) throw 'd';
  if (coinChange([186, 419, 83, 408], 6249) != 20) throw 'e';
  if (coinChange([2, 5, 10, 1], 27) != 4) throw 'f';
  print('All tests passed!');
}
