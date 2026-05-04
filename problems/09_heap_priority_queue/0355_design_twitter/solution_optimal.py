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
        self.time = 0
        self.tweets: Dict[int, List[Tuple[int, int]]] = {}
        self.follows: Dict[int, Set[int]] = {}

    def postTweet(self, userId: int, tweetId: int) -> None:
        self.tweets.setdefault(userId, []).append((self.time, tweetId))
        self.time += 1

    def getNewsFeed(self, userId: int) -> List[int]:
        followees = set(self.follows.get(userId, set()))
        followees.add(userId)
        # max-heap by time: push (-time, tweetId, uid, idx)
        h: List = []
        for u in followees:
            lst = self.tweets.get(u)
            if lst:
                idx = len(lst) - 1
                t, tid = lst[idx]
                heapq.heappush(h, (-t, tid, u, idx))
        out: List[int] = []
        while h and len(out) < 10:
            t, tid, u, idx = heapq.heappop(h)
            out.append(tid)
            if idx > 0:
                lst = self.tweets[u]
                nt, ntid = lst[idx - 1]
                heapq.heappush(h, (-nt, ntid, u, idx - 1))
        return out

    def follow(self, followerId: int, followeeId: int) -> None:
        if followerId == followeeId: return
        self.follows.setdefault(followerId, set()).add(followeeId)

    def unfollow(self, followerId: int, followeeId: int) -> None:
        s = self.follows.get(followerId)
        if s and followeeId in s:
            s.remove(followeeId)


if __name__ == "__main__":
    tw = Twitter()
    tw.postTweet(1, 5)
    assert tw.getNewsFeed(1) == [5]
    tw.follow(1, 2)
    tw.postTweet(2, 6)
    assert tw.getNewsFeed(1) == [6, 5]
    tw.unfollow(1, 2)
    assert tw.getNewsFeed(1) == [5]
    # 11 tweets: only 10
    tw2 = Twitter()
    for i in range(11):
        tw2.postTweet(1, i)
    assert tw2.getNewsFeed(1) == list(range(10, 0, -1))
    # follow self should not duplicate
    tw3 = Twitter()
    tw3.postTweet(1, 1)
    tw3.follow(1, 1)
    assert tw3.getNewsFeed(1) == [1]
    print("All tests passed!")
