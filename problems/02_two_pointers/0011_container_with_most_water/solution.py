"""
Problem: 11. Container With Most Water
Difficulty: Medium
URL: https://leetcode.com/problems/container-with-most-water/

【解法演進】暴力雙重迴圈 O(n²) → 雙指標相向 O(n)（最佳）
【最佳解核心思路】
    左右指標相向收斂，每次移動較矮的一側，因為較高側若移動只會雙輸。
【複雜度】時間：O(n)  空間：O(1)
"""
from typing import List


class Solution:
    # 最佳解：雙指標
    def maxArea(self, height: List[int]) -> int:
        l, r = 0, len(height) - 1
        best = 0
        while l < r:
            area = min(height[l], height[r]) * (r - l)
            if area > best:
                best = area
            if height[l] < height[r]:
                l += 1
            else:
                r -= 1
        return best

    # 暴力解
    def maxArea_brute(self, height: List[int]) -> int:
        n = len(height)
        best = 0
        for i in range(n):
            for j in range(i + 1, n):
                area = min(height[i], height[j]) * (j - i)
                if area > best:
                    best = area
        return best


if __name__ == "__main__":
    s = Solution()

    assert s.maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]) == 49, "Test 1 failed"
    assert s.maxArea([1, 1]) == 1, "Test 2 failed"
    assert s.maxArea([4, 3, 2, 1, 4]) == 16, "Test 3 failed"
    assert s.maxArea([1, 2, 1]) == 2, "Test 4 failed"
    assert s.maxArea([0, 0]) == 0, "Test 5 failed (zeros)"
    assert s.maxArea([2, 3, 4, 5, 18, 17, 6]) == 17, "Test 6 failed"

    assert s.maxArea_brute([1, 8, 6, 2, 5, 4, 8, 3, 7]) == 49, "Brute Test failed"

    print("All tests passed!")
