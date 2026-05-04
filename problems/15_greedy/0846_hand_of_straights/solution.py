"""
Problem: 0846. Hand of Straights
"""
from typing import List
from collections import Counter


class Solution:
    def isNStraightHand(self, hand: List[int], groupSize: int) -> bool:
        if len(hand) % groupSize:
            return False
        cnt = Counter(hand)
        for x in sorted(cnt):
            c = cnt[x]
            if c <= 0:
                continue
            for k in range(groupSize):
                if cnt[x + k] < c:
                    return False
                cnt[x + k] -= c
        return True


if __name__ == "__main__":
    sol = Solution()
    assert sol.isNStraightHand([1, 2, 3, 6, 2, 3, 4, 7, 8], 3) is True
    assert sol.isNStraightHand([1, 2, 3, 4, 5], 4) is False
    assert sol.isNStraightHand([1, 2, 3, 4, 5, 6], 2) is True
    assert sol.isNStraightHand([1], 1) is True
    assert sol.isNStraightHand([8, 8, 9, 7, 7, 7, 6, 7, 9], 3) is False
    print("All tests passed!")
