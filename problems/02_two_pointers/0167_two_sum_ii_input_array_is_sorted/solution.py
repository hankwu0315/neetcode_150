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
        pass

    def twoSum_brute(self, numbers: List[int], target: int) -> List[int]:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
