"""
Problem: 238. Product of Array Except Self
Difficulty: Medium
URL: https://leetcode.com/problems/product-of-array-except-self/

【解法演進】暴力 O(n²) → 左右前綴 O(n)/O(n) → 原地兩遍掃描 O(n)/O(1)（最佳）
【最佳解核心思路】
    第一遍由左到右把左前綴積寫進 answer；
    第二遍由右到左用變數 right 累乘右後綴，就地與 answer 相乘。
【複雜度】時間：O(n)  空間：O(1)（不計輸出）
"""

from typing import List

class Solution:
    # 最佳解：原地兩遍掃描
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        pass

    def productExceptSelf_brute(self, nums: List[int]) -> List[int]:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
