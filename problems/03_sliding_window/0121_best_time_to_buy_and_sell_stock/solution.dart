// Problem: 121. Best Time to Buy and Sell Stock
// Difficulty: Easy
// URL: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
//
// 【解法演進】暴力 O(n²) → 一遍掃描維護最小價 O(n)（最佳）
// 【最佳解核心思路】記錄迄今最低買價，今天賣出可得最大利潤。
// 【複雜度】時間：O(n)  空間：O(1)

int maxProfit(List<int> prices) {
  int best = 0;
  int minPrice = 1 << 30;
  for (final p in prices) {
    if (p - minPrice > best) best = p - minPrice;
    if (p < minPrice) minPrice = p;
  }
  return best;
}

int maxProfitBrute(List<int> prices) {
  int best = 0;
  for (int i = 0; i < prices.length; i++) {
    for (int j = i + 1; j < prices.length; j++) {
      if (prices[j] - prices[i] > best) best = prices[j] - prices[i];
    }
  }
  return best;
}

void _expect(int actual, int expected, String name) {
  if (actual == expected) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $expected but got $actual');
  }
}

void main() {
  _expect(maxProfit([7, 1, 5, 3, 6, 4]), 5, 'Test 1');
  _expect(maxProfit([7, 6, 4, 3, 1]), 0, 'Test 2');
  _expect(maxProfit([1]), 0, 'Test 3: single');
  _expect(maxProfit([]), 0, 'Test 4: empty');
  _expect(maxProfit([2, 4, 1]), 2, 'Test 5');
  _expect(maxProfit([3, 3, 3, 3]), 0, 'Test 6: flat');
  _expect(maxProfitBrute([7, 1, 5, 3, 6, 4]), 5, 'Brute Test');

  print('All tests passed!');
}
