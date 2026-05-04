// Problem: 0875. Koko Eating Bananas
// Difficulty: Medium
// 二分速度 k。

int minEatingSpeed(List<int> piles, int h) {
  int hours(int k) {
    int t = 0;
    for (final p in piles) {
      t += (p + k - 1) ~/ k;
    }
    return t;
  }

  int l = 1, r = piles.reduce((a, b) => a > b ? a : b);
  while (l < r) {
    final mid = l + (r - l) ~/ 2;
    if (hours(mid) <= h) {
      r = mid;
    } else {
      l = mid + 1;
    }
  }
  return l;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(minEatingSpeed([3, 6, 7, 11], 8), 4, 'ex1');
  _expect(minEatingSpeed([30, 11, 23, 4, 20], 5), 30, 'ex2');
  _expect(minEatingSpeed([30, 11, 23, 4, 20], 6), 23, 'ex3');
  _expect(minEatingSpeed([1, 1, 1, 1], 4), 1, 'h=n');
  _expect(minEatingSpeed([10], 5), 2, 'single1');
  _expect(minEatingSpeed([10], 10), 1, 'single2');
  print('All tests passed!');
}
