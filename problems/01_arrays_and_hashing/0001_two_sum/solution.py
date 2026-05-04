"""
Problem: 1. Two Sum
Difficulty: Easy
URL: https://leetcode.com/problems/two-sum/

【解法演進】暴力 O(n²) → 一遍雜湊 O(n)（最佳）
【最佳解核心思路】
    走訪 nums，對每個 x 先檢查 (target - x) 是否已在 seen；
    沒有則 seen[x] = i 繼續。先查再寫避免使用同一元素兩次。
【複雜度】時間：O(n)  空間：O(n)
"""

from typing import List

class Solution:
    # 最佳解：一遍 HashMap
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        pass

    def twoSum_brute(self, nums: List[int], target: int) -> List[int]:
        pass


def _norm(pair: List[int]) -> List[int]:
    """測試輔助：將索引對排序，方便比對。"""
    return sorted(pair)

if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
