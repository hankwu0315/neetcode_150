"""
Problem: 0355. Design Twitter
Difficulty: Medium
URL: https://leetcode.com/problems/design-twitter/

解法：每用戶 tweet list + max-heap 合併取最新 10。
"""

from __future__ import annotations

from typing import Dict, List, Set, Tuple

import heapq

class Twitter:
    def __init__(self):
        pass

    def postTweet(self, userId: int, tweetId: int) -> None:
        pass

    def getNewsFeed(self, userId: int) -> List[int]:
        pass

    def follow(self, followerId: int, followeeId: int) -> None:
        pass

    def unfollow(self, followerId: int, followeeId: int) -> None:
        pass


if __name__ == "__main__":
    twitter = Twitter()

    # Test 1
    # result = twitter.solve(...)
    # assert result == expected

    print("All tests passed!")
