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
        if len(nums1) > len(nums2):
            nums1, nums2 = nums2, nums1
        m, n = len(nums1), len(nums2)
        half = (m + n + 1) // 2
        l, r = 0, m
        while l <= r:
            i = (l + r) // 2
            j = half - i
            l1 = nums1[i - 1] if i > 0 else -self.INF
            r1 = nums1[i] if i < m else self.INF
            l2 = nums2[j - 1] if j > 0 else -self.INF
            r2 = nums2[j] if j < n else self.INF
            if l1 <= r2 and l2 <= r1:
                if (m + n) % 2 == 1:
                    return float(max(l1, l2))
                return (max(l1, l2) + min(r1, r2)) / 2.0
            if l1 > r2:
                r = i - 1
            else:
                l = i + 1
        return 0.0  # unreachable

    def findMedianSortedArrays_brute(self, nums1: list[int], nums2: list[int]) -> float:
        merged = sorted(nums1 + nums2)
        n = len(merged)
        if n % 2 == 1:
            return float(merged[n // 2])
        return (merged[n // 2 - 1] + merged[n // 2]) / 2.0


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.findMedianSortedArrays, sol.findMedianSortedArrays_brute):
        assert fn([1, 3], [2]) == 2.0
        assert fn([1, 2], [3, 4]) == 2.5
        assert fn([], [1]) == 1.0
        assert fn([2], []) == 2.0
        assert fn([1, 2], [3, 4, 5]) == 3.0
        # 完全不重疊
        assert fn([1, 2, 3], [10, 20, 30]) == (3 + 10) / 2
        # 含負數
        assert fn([-5, -3], [-2, 0]) == (-3 + -2) / 2
    print("All tests passed!")
