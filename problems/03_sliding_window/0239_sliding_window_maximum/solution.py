"""
Problem: 239. Sliding Window Maximum
Difficulty: Hard
URL: https://leetcode.com/problems/sliding-window-maximum/

【解法演進】每窗口 max O(n·k) → max-heap O(n log n) → 單調遞減 deque O(n)（最佳）
【最佳解核心思路】
    deque 存索引，對應 nums 值遞減；新元素從尾部彈掉小於等於它的舊元素，
    隊首離開窗口時從前彈出。每索引至多進出一次。
【複雜度】時間：O(n)  空間：O(k)
"""

from collections import deque

from typing import List

class Solution:
    # 最佳解：單調遞減 deque
    def maxSlidingWindow(self, nums: List[int], k: int) -> List[int]:
        pass

    def maxSlidingWindow_brute(self, nums: List[int], k: int) -> List[int]:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
