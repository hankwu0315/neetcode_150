"""
Problem: 0004. Median of Two Sorted Arrays
Difficulty: Hard
URL: https://leetcode.com/problems/median-of-two-sorted-arrays/

解法演進：
1) 合併兩陣列 O(m+n)。
2) 對較短陣列做切割二分 O(log min(m,n))。

最佳解核心思路：
- 切割兩陣列使「左半元素數 = 右半 (或左多 1)」，且滿足左半最大 <= 右半最小。

複雜度：O(log min(m,n)) / O(1)。
"""

class Solution:
    INF = float("inf")
    def findMedianSortedArrays(self, nums1: list[int], nums2: list[int]) -> float:
        # 確保 nums1 較短
        pass

    def findMedianSortedArrays_brute(self, nums1: list[int], nums2: list[int]) -> float:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
