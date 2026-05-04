"""
Problem: 0763. Partition Labels
"""
from typing import List


class Solution:
    def partitionLabels(self, s: str) -> List[int]:
        last = {c: i for i, c in enumerate(s)}
        res = []
        start = end = 0
        for i, c in enumerate(s):
            if last[c] > end:
                end = last[c]
            if i == end:
                res.append(end - start + 1)
                start = i + 1
        return res


if __name__ == "__main__":
    sol = Solution()
    assert sol.partitionLabels("ababcbacadefegdehijhklij") == [9, 7, 8]
    assert sol.partitionLabels("eccbbbbdec") == [10]
    assert sol.partitionLabels("a") == [1]
    assert sol.partitionLabels("abc") == [1, 1, 1]
    assert sol.partitionLabels("aaabbb") == [3, 3]
    print("All tests passed!")
