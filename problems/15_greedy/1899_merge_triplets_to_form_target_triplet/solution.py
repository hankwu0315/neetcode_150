"""
Problem: 1899. Merge Triplets to Form Target Triplet
"""
from typing import List


class Solution:
    def mergeTriplets(self, triplets: List[List[int]], target: List[int]) -> bool:
        good = [0, 0, 0]
        for t in triplets:
            if t[0] > target[0] or t[1] > target[1] or t[2] > target[2]:
                continue
            for i in range(3):
                if t[i] > good[i]:
                    good[i] = t[i]
        return good == target


if __name__ == "__main__":
    sol = Solution()
    assert sol.mergeTriplets([[2, 5, 3], [1, 8, 4], [1, 7, 5]], [2, 7, 5]) is True
    assert sol.mergeTriplets([[3, 4, 5], [4, 5, 6]], [3, 2, 5]) is False
    assert sol.mergeTriplets([[2, 5, 3], [2, 3, 4], [1, 2, 5], [5, 2, 3]], [5, 5, 5]) is True
    assert sol.mergeTriplets([[1, 1, 1]], [2, 2, 2]) is False
    assert sol.mergeTriplets([[2, 5, 3]], [2, 5, 3]) is True
    print("All tests passed!")
