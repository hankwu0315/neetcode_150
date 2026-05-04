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
        dq = deque()  # 索引
        result: List[int] = []
        for r, x in enumerate(nums):
            # 隊首離開窗口
            while dq and dq[0] <= r - k:
                dq.popleft()
            # 從尾部彈出較小者
            while dq and nums[dq[-1]] <= x:
                dq.pop()
            dq.append(r)
            if r >= k - 1:
                result.append(nums[dq[0]])
        return result

    # 暴力解
    def maxSlidingWindow_brute(self, nums: List[int], k: int) -> List[int]:
        n = len(nums)
        return [max(nums[i : i + k]) for i in range(n - k + 1)]


if __name__ == "__main__":
    s = Solution()

    assert s.maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3) == [3, 3, 5, 5, 6, 7], "Test 1 failed"
    assert s.maxSlidingWindow([1], 1) == [1], "Test 2 failed"
    assert s.maxSlidingWindow([1, -1], 1) == [1, -1], "Test 3 failed"
    assert s.maxSlidingWindow([7, 6, 5, 4, 3], 2) == [7, 6, 5, 4], "Test 4 failed (decreasing)"
    assert s.maxSlidingWindow([1, 2, 3, 4, 5], 5) == [5], "Test 5 failed (k=n)"
    assert s.maxSlidingWindow([4, 4, 4, 4], 2) == [4, 4, 4], "Test 6 failed (dups)"

    assert s.maxSlidingWindow_brute([1, 3, -1, -3, 5, 3, 6, 7], 3) == [3, 3, 5, 5, 6, 7], "Brute Test failed"

    print("All tests passed!")
