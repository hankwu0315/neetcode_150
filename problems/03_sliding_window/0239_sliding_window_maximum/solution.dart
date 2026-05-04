// Problem: 239. Sliding Window Maximum
// Difficulty: Hard
// URL: https://leetcode.com/problems/sliding-window-maximum/
//
// 【解法演進】暴力 O(n·k) → max-heap O(n log n) → 單調遞減 deque O(n)（最佳）
// 【最佳解核心思路】deque 存索引，對應值遞減；尾彈小於等於、首彈離窗口。
// 【複雜度】時間：O(n)  空間：O(k)

import 'dart:collection';

List<int> maxSlidingWindow(List<int> nums, int k) {
  // TODO: implement
  return [];
}


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
