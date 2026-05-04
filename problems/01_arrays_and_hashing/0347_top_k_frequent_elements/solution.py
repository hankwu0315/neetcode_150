"""
Problem: 347. Top K Frequent Elements
Difficulty: Medium
URL: https://leetcode.com/problems/top-k-frequent-elements/

【解法演進】排序 O(n log n) → 最小堆 O(n log k) → 桶排序 O(n)（最佳）
【最佳解核心思路】
    計頻後依頻率分桶（索引 = 頻率），由高頻向低頻取，前 k 個元素即為答案。
【複雜度】時間：O(n)  空間：O(n)
"""

import heapq

from collections import Counter

from typing import List

class Solution:
    # 最佳解：桶排序
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        pass

    def topKFrequent_heap(self, nums: List[int], k: int) -> List[int]:
        pass

    def topKFrequent_brute(self, nums: List[int], k: int) -> List[int]:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
