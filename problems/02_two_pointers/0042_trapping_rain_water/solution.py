"""
Problem: 42. Trapping Rain Water
Difficulty: Hard
URL: https://leetcode.com/problems/trapping-rain-water/

【解法演進】暴力 O(n²) → 前綴後綴最大值 O(n)/O(n) → 雙指標 O(n)/O(1)（最佳）
【最佳解核心思路】
    維護 l, r, lMax, rMax；何側較矮便結算何側水量並更新。
【複雜度】時間：O(n)  空間：O(1)
"""
from typing import List


class Solution:
    # 最佳解：雙指標
    def trap(self, height: List[int]) -> int:
        n = len(height)
        if n < 3:
            return 0
        l, r = 0, n - 1
        lMax = rMax = 0
        water = 0
        while l < r:
            if height[l] < height[r]:
                if height[l] >= lMax:
                    lMax = height[l]
                else:
                    water += lMax - height[l]
                l += 1
            else:
                if height[r] >= rMax:
                    rMax = height[r]
                else:
                    water += rMax - height[r]
                r -= 1
        return water

    # 進階解：前綴後綴最大值
    def trap_arrays(self, height: List[int]) -> int:
        n = len(height)
        if n == 0:
            return 0
        leftMax = [0] * n
        rightMax = [0] * n
        leftMax[0] = height[0]
        for i in range(1, n):
            leftMax[i] = max(leftMax[i - 1], height[i])
        rightMax[-1] = height[-1]
        for i in range(n - 2, -1, -1):
            rightMax[i] = max(rightMax[i + 1], height[i])
        return sum(min(leftMax[i], rightMax[i]) - height[i] for i in range(n))

    # 暴力解
    def trap_brute(self, height: List[int]) -> int:
        n = len(height)
        water = 0
        for i in range(n):
            l = max(height[: i + 1])
            r = max(height[i:])
            water += min(l, r) - height[i]
        return water


if __name__ == "__main__":
    s = Solution()

    assert s.trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) == 6, "Test 1 failed"
    assert s.trap([4, 2, 0, 3, 2, 5]) == 9, "Test 2 failed"
    assert s.trap([]) == 0, "Test 3 failed (empty)"
    assert s.trap([1, 2, 3]) == 0, "Test 4 failed (monotonic)"
    assert s.trap([3, 0, 2, 0, 4]) == 7, "Test 5 failed"
    assert s.trap([0, 0, 0]) == 0, "Test 6 failed (all zero)"

    assert s.trap_arrays([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) == 6
    assert s.trap_brute([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) == 6

    print("All tests passed!")
