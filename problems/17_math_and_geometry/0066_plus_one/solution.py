"""
Problem: 0066. Plus One
"""
from typing import List


class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        d = digits[:]
        i = len(d) - 1
        while i >= 0:
            if d[i] < 9:
                d[i] += 1
                return d
            d[i] = 0
            i -= 1
        return [1] + d


if __name__ == "__main__":
    sol = Solution()
    assert sol.plusOne([1, 2, 3]) == [1, 2, 4]
    assert sol.plusOne([4, 3, 2, 1]) == [4, 3, 2, 2]
    assert sol.plusOne([9]) == [1, 0]
    assert sol.plusOne([9, 9, 9]) == [1, 0, 0, 0]
    assert sol.plusOne([0]) == [1]
    print("All tests passed!")
