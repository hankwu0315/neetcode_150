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
        n = len(nums)
        answer = [1] * n
        # 第一遍：左前綴
        for i in range(1, n):
            answer[i] = answer[i - 1] * nums[i - 1]
        # 第二遍：右後綴
        right = 1
        for i in range(n - 1, -1, -1):
            answer[i] *= right
            right *= nums[i]
        return answer

    # 暴力解
    def productExceptSelf_brute(self, nums: List[int]) -> List[int]:
        n = len(nums)
        result = [0] * n
        for i in range(n):
            p = 1
            for j in range(n):
                if j != i:
                    p *= nums[j]
            result[i] = p
        return result


if __name__ == "__main__":
    s = Solution()

    assert s.productExceptSelf([1, 2, 3, 4]) == [24, 12, 8, 6], "Test 1 failed"
    assert s.productExceptSelf([-1, 1, 0, -3, 3]) == [0, 0, 9, 0, 0], "Test 2 failed"
    assert s.productExceptSelf([2, 3]) == [3, 2], "Test 3 failed (length 2)"
    assert s.productExceptSelf([0, 0]) == [0, 0], "Test 4 failed (two zeros)"
    assert s.productExceptSelf([1, 1, 1, 1]) == [1, 1, 1, 1], "Test 5 failed (all ones)"
    assert s.productExceptSelf([-1, -1, -1, -1]) == [-1, -1, -1, -1], "Test 6 failed (all -1)"

    assert s.productExceptSelf_brute([1, 2, 3, 4]) == [24, 12, 8, 6], "Brute Test failed"

    print("All tests passed!")
