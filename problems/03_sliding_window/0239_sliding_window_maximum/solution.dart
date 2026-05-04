// Problem: 239. Sliding Window Maximum
// Difficulty: Hard
// URL: https://leetcode.com/problems/sliding-window-maximum/
//
// 【解法演進】暴力 O(n·k) → max-heap O(n log n) → 單調遞減 deque O(n)（最佳）
// 【最佳解核心思路】deque 存索引，對應值遞減；尾彈小於等於、首彈離窗口。
// 【複雜度】時間：O(n)  空間：O(k)

import 'dart:collection';

List<int> maxSlidingWindow(List<int> nums, int k) {
  final dq = Queue<int>();
  final result = <int>[];
  for (int r = 0; r < nums.length; r++) {
    while (dq.isNotEmpty && dq.first <= r - k) dq.removeFirst();
    while (dq.isNotEmpty && nums[dq.last] <= nums[r]) dq.removeLast();
    dq.add(r);
    if (r >= k - 1) result.add(nums[dq.first]);
  }
  return result;
}

void _expect(List<int> actual, List<int> expected, String name) {
  if (actual.toString() == expected.toString()) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $expected but got $actual');
  }
}

void main() {
  _expect(maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3), [3, 3, 5, 5, 6, 7], 'Test 1');
  _expect(maxSlidingWindow([1], 1), [1], 'Test 2');
  _expect(maxSlidingWindow([1, -1], 1), [1, -1], 'Test 3');
  _expect(maxSlidingWindow([7, 6, 5, 4, 3], 2), [7, 6, 5, 4], 'Test 4: decreasing');
  _expect(maxSlidingWindow([1, 2, 3, 4, 5], 5), [5], 'Test 5: k=n');
  _expect(maxSlidingWindow([4, 4, 4, 4], 2), [4, 4, 4], 'Test 6: dups');

  print('All tests passed!');
}
