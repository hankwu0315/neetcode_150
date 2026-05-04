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
        nums = sorted(nums)
        n = len(nums)
        result: List[List[int]] = []
        for i in range(n - 2):
            if nums[i] > 0:
                break
            if i > 0 and nums[i] == nums[i - 1]:
                continue
            target = -nums[i]
            l, r = i + 1, n - 1
            while l < r:
                total = nums[l] + nums[r]
                if total == target:
                    result.append([nums[i], nums[l], nums[r]])
                    l += 1
                    r -= 1
                    while l < r and nums[l] == nums[l - 1]:
                        l += 1
                    while l < r and nums[r] == nums[r + 1]:
                        r -= 1
                elif total < target:
                    l += 1
                else:
                    r -= 1
        return result

    # 暴力解
    def threeSum_brute(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)
        seen = set()
        for i in range(n):
            for j in range(i + 1, n):
                for k in range(j + 1, n):
                    if nums[i] + nums[j] + nums[k] == 0:
                        seen.add(tuple(sorted([nums[i], nums[j], nums[k]])))
        return [list(t) for t in seen]


def _norm(triplets: List[List[int]]) -> List[List[int]]:
    return sorted([sorted(t) for t in triplets])


if __name__ == "__main__":
    s = Solution()

    assert _norm(s.threeSum([-1, 0, 1, 2, -1, -4])) == _norm([[-1, -1, 2], [-1, 0, 1]]), "Test 1 failed"
    assert s.threeSum([0, 1, 1]) == [], "Test 2 failed"
    assert _norm(s.threeSum([0, 0, 0])) == [[0, 0, 0]], "Test 3 failed"
    assert s.threeSum([1, 2, 3]) == [], "Test 4 failed (no solution)"
    assert _norm(s.threeSum([0, 0, 0, 0])) == [[0, 0, 0]], "Test 5 failed (dups)"
    assert _norm(s.threeSum([-2, 0, 0, 2, 2])) == [[-2, 0, 2]], "Test 6 failed"

    assert _norm(s.threeSum_brute([-1, 0, 1, 2, -1, -4])) == _norm([[-1, -1, 2], [-1, 0, 1]]), "Brute Test failed"

    print("All tests passed!")
