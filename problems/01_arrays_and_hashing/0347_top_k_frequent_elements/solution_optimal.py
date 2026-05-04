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
        count = Counter(nums)
        n = len(nums)
        buckets: List[List[int]] = [[] for _ in range(n + 1)]
        for num, freq in count.items():
            buckets[freq].append(num)

        result: List[int] = []
        for f in range(n, 0, -1):
            for num in buckets[f]:
                result.append(num)
                if len(result) == k:
                    return result
        return result

    # 進階解：最小堆
    def topKFrequent_heap(self, nums: List[int], k: int) -> List[int]:
        count = Counter(nums)
        # 利用 nlargest 直接取頻率最大 k 個
        return [num for num, _ in heapq.nlargest(k, count.items(), key=lambda x: x[1])]

    # 暴力解：排序
    def topKFrequent_brute(self, nums: List[int], k: int) -> List[int]:
        count = Counter(nums)
        items = sorted(count.items(), key=lambda x: -x[1])
        return [num for num, _ in items[:k]]


if __name__ == "__main__":
    s = Solution()

    assert sorted(s.topKFrequent([1, 1, 1, 2, 2, 3], 2)) == [1, 2], "Test 1 failed"
    assert sorted(s.topKFrequent([1], 1)) == [1], "Test 2 failed"
    assert sorted(s.topKFrequent([1, 2], 2)) == [1, 2], "Test 3 failed"
    assert sorted(s.topKFrequent([4, 1, -1, 2, -1, 2, 3], 2)) == [-1, 2], "Test 4 failed (negatives)"
    assert sorted(s.topKFrequent([5, 5, 5, 5], 1)) == [5], "Test 5 failed (single value)"

    assert sorted(s.topKFrequent_heap([1, 1, 1, 2, 2, 3], 2)) == [1, 2], "Heap Test failed"
    assert sorted(s.topKFrequent_brute([1, 1, 1, 2, 2, 3], 2)) == [1, 2], "Brute Test failed"

    print("All tests passed!")
