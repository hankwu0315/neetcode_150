// Problem: 42. Trapping Rain Water
// Difficulty: Hard
// URL: https://leetcode.com/problems/trapping-rain-water/
//
// 【解法演進】暴力 O(n²) → 前綴後綴 O(n)/O(n) → 雙指標 O(n)/O(1)（最佳）
// 【最佳解核心思路】何側較矮就結算何側水量並更新該側 max。
// 【複雜度】時間：O(n)  空間：O(1)

int trap(List<int> height) {
  final n = height.length;
  if (n < 3) return 0;
  int l = 0, r = n - 1;
  int lMax = 0, rMax = 0, water = 0;
  while (l < r) {
    if (height[l] < height[r]) {
      if (height[l] >= lMax) {
        lMax = height[l];
      } else {
        water += lMax - height[l];
      }
      l++;
    } else {
      if (height[r] >= rMax) {
        rMax = height[r];
      } else {
        water += rMax - height[r];
      }
      r--;
    }
  }
  return water;
}

int trapArrays(List<int> height) {
  final n = height.length;
  if (n == 0) return 0;
  final leftMax = List<int>.filled(n, 0);
  final rightMax = List<int>.filled(n, 0);
  leftMax[0] = height[0];
  for (int i = 1; i < n; i++) {
    leftMax[i] = leftMax[i - 1] > height[i] ? leftMax[i - 1] : height[i];
  }
  rightMax[n - 1] = height[n - 1];
  for (int i = n - 2; i >= 0; i--) {
    rightMax[i] = rightMax[i + 1] > height[i] ? rightMax[i + 1] : height[i];
  }
  int water = 0;
  for (int i = 0; i < n; i++) {
    final m = leftMax[i] < rightMax[i] ? leftMax[i] : rightMax[i];
    water += m - height[i];
  }
  return water;
}

void _expect(int actual, int expected, String name) {
  if (actual == expected) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $expected but got $actual');
  }
}

void main() {
  _expect(trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]), 6, 'Test 1');
  _expect(trap([4, 2, 0, 3, 2, 5]), 9, 'Test 2');
  _expect(trap([]), 0, 'Test 3: empty');
  _expect(trap([1, 2, 3]), 0, 'Test 4: monotonic');
  _expect(trap([3, 0, 2, 0, 4]), 7, 'Test 5');
  _expect(trap([0, 0, 0]), 0, 'Test 6: all zero');
  _expect(trapArrays([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]), 6, 'Arrays Test');

  print('All tests passed!');
}
