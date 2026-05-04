"""
Problem: 128. Longest Consecutive Sequence
Difficulty: Medium
URL: https://leetcode.com/problems/longest-consecutive-sequence/

【解法演進】排序 O(n log n) → HashSet + 從起點展開 O(n)（最佳）
【最佳解核心思路】
    將 nums 放入 set。對每個 x，僅當 (x - 1) 不在 set 時 x 為序列起點，
    從 x 開始向上連續查找 x+1, x+2,...，計算長度。
    每個元素至多被檢查兩次，整體 O(n)。
【複雜度】時間：O(n)  空間：O(n)
"""
from typing import List


class Solution:
    # 最佳解：HashSet + 從起點展開
    def longestConsecutive(self, nums: List[int]) -> int:
        s = set(nums)
        best = 0
        for x in s:
            if x - 1 not in s:  # x 是某個序列的起點
                cur = x
                length = 1
                while cur + 1 in s:
                    cur += 1
                    length += 1
                best = max(best, length)
        return best

    # 暴力解：排序
    def longestConsecutive_brute(self, nums: List[int]) -> int:
        if not nums:
            return 0
        arr = sorted(set(nums))
        best = 1
        cur = 1
        for i in range(1, len(arr)):
            if arr[i] == arr[i - 1] + 1:
                cur += 1
                best = max(best, cur)
            else:
                cur = 1
        return best


if __name__ == "__main__":
    s = Solution()

    assert s.longestConsecutive([100, 4, 200, 1, 3, 2]) == 4, "Test 1 failed"
    assert s.longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]) == 9, "Test 2 failed"
    assert s.longestConsecutive([]) == 0, "Test 3 failed (empty)"
    assert s.longestConsecutive([1]) == 1, "Test 4 failed (single)"
    assert s.longestConsecutive([1, 1, 1]) == 1, "Test 5 failed (all dups)"
    assert s.longestConsecutive([-1, -2, -3, 0, 1]) == 5, "Test 6 failed (negatives)"
    assert s.longestConsecutive([10, 20, 30]) == 1, "Test 7 failed (no consecutive)"

    assert s.longestConsecutive_brute([100, 4, 200, 1, 3, 2]) == 4, "Brute Test failed"

    print("All tests passed!")
