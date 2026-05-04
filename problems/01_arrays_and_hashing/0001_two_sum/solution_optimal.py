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
        seen: dict[int, int] = {}
        for i, x in enumerate(nums):
            comp = target - x
            if comp in seen:
                return [seen[comp], i]
            seen[x] = i
        return []  # 題目保證有解，不會走到這裡

    # 暴力解：兩兩配對
    def twoSum_brute(self, nums: List[int], target: int) -> List[int]:
        n = len(nums)
        for i in range(n):
            for j in range(i + 1, n):
                if nums[i] + nums[j] == target:
                    return [i, j]
        return []


def _norm(pair: List[int]) -> List[int]:
    """測試輔助：將索引對排序，方便比對。"""
    return sorted(pair)


if __name__ == "__main__":
    s = Solution()

    assert _norm(s.twoSum([2, 7, 11, 15], 9)) == [0, 1], "Test 1 failed"
    assert _norm(s.twoSum([3, 2, 4], 6)) == [1, 2], "Test 2 failed"
    assert _norm(s.twoSum([3, 3], 6)) == [0, 1], "Test 3 failed (same value)"
    assert _norm(s.twoSum([-1, -2, -3, -4, -5], -8)) == [2, 4], "Test 4 failed (negatives)"
    assert _norm(s.twoSum([0, 4, 3, 0], 0)) == [0, 3], "Test 5 failed (zeros)"

    # 暴力解驗證
    assert _norm(s.twoSum_brute([2, 7, 11, 15], 9)) == [0, 1], "Brute Test 1"
    assert _norm(s.twoSum_brute([3, 3], 6)) == [0, 1], "Brute Test 2"

    print("All tests passed!")
