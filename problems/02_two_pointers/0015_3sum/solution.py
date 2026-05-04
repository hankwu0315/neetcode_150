"""
Problem: 15. 3Sum
Difficulty: Medium
URL: https://leetcode.com/problems/3sum/

【解法演進】暴力三層迴圈 O(n³) → 排序 + 固定 + 雙指標 O(n²)（最佳）
【最佳解核心思路】
    排序後固定 nums[i]，在 [i+1, n-1] 用雙指標找 sum = -nums[i]；
    跳過 i、l、r 上的重複以避免重複三元組。
【複雜度】時間：O(n²)  空間：O(1)（不計輸出/排序內部）
"""

from typing import List

class Solution:
    # 最佳解
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        pass

    def threeSum_brute(self, nums: List[int]) -> List[List[int]]:
        pass


def _norm(triplets: List[List[int]]) -> List[List[int]]:
    return sorted([sorted(t) for t in triplets])

if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
