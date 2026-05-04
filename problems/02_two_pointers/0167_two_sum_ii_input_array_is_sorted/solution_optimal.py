"""
Problem: 167. Two Sum II - Input Array Is Sorted
Difficulty: Medium
URL: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

【解法演進】HashMap O(n)/O(n) → 雙指標相向 O(n)/O(1)（最佳）
【最佳解核心思路】
    利用陣列已排序的單調性：sum<target 移左，sum>target 移右。
【複雜度】時間：O(n)  空間：O(1)
"""
from typing import List


class Solution:
    # 最佳解：雙指標
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        l, r = 0, len(numbers) - 1
        while l < r:
            total = numbers[l] + numbers[r]
            if total == target:
                return [l + 1, r + 1]
            if total < target:
                l += 1
            else:
                r -= 1
        return []

    # 暴力解：HashMap
    def twoSum_brute(self, numbers: List[int], target: int) -> List[int]:
        seen = {}
        for i, x in enumerate(numbers):
            need = target - x
            if need in seen:
                return [seen[need] + 1, i + 1]
            seen[x] = i
        return []


if __name__ == "__main__":
    s = Solution()

    assert s.twoSum([2, 7, 11, 15], 9) == [1, 2], "Test 1 failed"
    assert s.twoSum([2, 3, 4], 6) == [1, 3], "Test 2 failed"
    assert s.twoSum([-1, 0], -1) == [1, 2], "Test 3 failed (negatives)"
    assert s.twoSum([1, 2, 3, 4, 5], 9) == [4, 5], "Test 4 failed"
    assert s.twoSum([0, 0, 3, 4], 0) == [1, 2], "Test 5 failed (zeros)"

    assert s.twoSum_brute([2, 7, 11, 15], 9) == [1, 2], "Brute Test failed"

    print("All tests passed!")
