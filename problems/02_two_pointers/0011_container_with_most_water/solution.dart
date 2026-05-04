// Problem: 11. Container With Most Water
// Difficulty: Medium
// URL: https://leetcode.com/problems/container-with-most-water/
//
// 【解法演進】暴力 O(n²) → 雙指標 O(n)（最佳）
// 【最佳解核心思路】每次移動較矮的一側。
// 【複雜度】時間：O(n)  空間：O(1)

int maxArea(List<int> height) {
  int l = 0, r = height.length - 1;
  int best = 0;
  while (l < r) {
    final h = height[l] < height[r] ? height[l] : height[r];
    final area = h * (r - l);
    if (area > best) best = area;
    if (height[l] < height[r]) {
      l++;
    } else {
      r--;
    }
  }
  return best;
}

int maxAreaBrute(List<int> height) {
  final n = height.length;
  int best = 0;
  for (int i = 0; i < n; i++) {
    for (int j = i + 1; j < n; j++) {
      final h = height[i] < height[j] ? height[i] : height[j];
      final area = h * (j - i);
      if (area > best) best = area;
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
  _expect(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]), 49, 'Test 1');
  _expect(maxArea([1, 1]), 1, 'Test 2');
  _expect(maxArea([4, 3, 2, 1, 4]), 16, 'Test 3');
  _expect(maxArea([1, 2, 1]), 2, 'Test 4');
  _expect(maxArea([0, 0]), 0, 'Test 5: zeros');
  _expect(maxArea([2, 3, 4, 5, 18, 17, 6]), 17, 'Test 6');
  _expect(maxAreaBrute([1, 8, 6, 2, 5, 4, 8, 3, 7]), 49, 'Brute Test');

  print('All tests passed!');
}
