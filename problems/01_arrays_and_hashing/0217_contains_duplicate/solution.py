"""
Problem: 217. Contains Duplicate
Difficulty: Easy
URL: https://leetcode.com/problems/contains-duplicate/

【解法演進】暴力 O(n²) → 排序 O(n log n) → 雜湊集合 O(n)（最佳）
【最佳解核心思路】
    維護一個集合 seen，走訪陣列時若 x 已在 seen 內代表重複，直接回傳 True；
    否則加入 seen 繼續。集合查詢均攤 O(1)。
【複雜度】時間：O(n)  空間：O(n)
"""
from typing import List


class Solution:
    # 最佳解：HashSet
    def containsDuplicate(self, nums: List[int]) -> bool:
        seen = set()
        for x in nums:
            if x in seen:
                return True
            seen.add(x)
        return False

    # 暴力解：兩兩比較
    def containsDuplicate_brute(self, nums: List[int]) -> bool:
        n = len(nums)
        for i in range(n):
            for j in range(i + 1, n):
                if nums[i] == nums[j]:
                    return True
        return False

    # 進階：排序後比鄰
    def containsDuplicate_sort(self, nums: List[int]) -> bool:
        arr = sorted(nums)
        for i in range(1, len(arr)):
            if arr[i] == arr[i - 1]:
                return True
        return False


if __name__ == "__main__":
    s = Solution()

    # Test 1：基本重複
    assert s.containsDuplicate([1, 2, 3, 1]) is True, "Test 1 failed"

    # Test 2：無重複
    assert s.containsDuplicate([1, 2, 3, 4]) is False, "Test 2 failed"

    # Test 3：多重複
    assert s.containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]) is True, "Test 3 failed"

    # Test 4：單元素
    assert s.containsDuplicate([1]) is False, "Test 4 failed (single element)"

    # Test 5：負數
    assert s.containsDuplicate([-1, -1]) is True, "Test 5 failed (negatives)"

    # 暴力法驗證
    assert s.containsDuplicate_brute([1, 2, 3, 1]) is True, "Brute Test 1 failed"
    assert s.containsDuplicate_brute([1, 2, 3, 4]) is False, "Brute Test 2 failed"

    # 排序法驗證
    assert s.containsDuplicate_sort([1, 2, 3, 1]) is True, "Sort Test 1 failed"
    assert s.containsDuplicate_sort([1, 2, 3, 4]) is False, "Sort Test 2 failed"

    print("All tests passed!")
