// 0309. Best Time to Buy and Sell Stock with Cooldown
import 'dart:math';
int maxProfit(List<int> prices) {
  if (prices.isEmpty) return 0;
  var hold = -prices[0], sold = 0, rest = 0;
  for (var i = 1; i < prices.length; i++) {
    final p = prices[i];
    final nh = max(hold, rest - p);
    final ns = hold + p;
    final nr = max(rest, sold);
    hold = nh; sold = ns; rest = nr;
  }
  return max(sold, rest);
}
void main() {
  if (maxProfit([1, 2, 3, 0, 2]) != 3) throw 'a';
  if (maxProfit([1]) != 0) throw 'b';
  if (maxProfit([]) != 0) throw 'c';
  if (maxProfit([1, 2, 4]) != 3) throw 'd';
  if (maxProfit([6, 1, 3, 2, 4, 7]) != 6) throw 'e';
  if (maxProfit([2, 1]) != 0) throw 'f';
  print('All tests passed!');
}
