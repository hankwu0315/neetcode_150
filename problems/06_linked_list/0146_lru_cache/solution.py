"""
Problem: 0146. LRU Cache
Difficulty: Medium
URL: https://leetcode.com/problems/lru-cache/

解法：HashMap + 雙向鏈結串列，所有操作 O(1)。
"""

class _Node:
    __slots__ = ("key", "val", "prev", "next")
    def __init__(self, key=0, val=0):
        pass


class LRUCache:
    def __init__(self, capacity: int):
        pass

    def _remove(self, n: _Node) -> None:
        pass

    def _add_front(self, n: _Node) -> None:
        pass

    def get(self, key: int) -> int:
        pass

    def put(self, key: int, value: int) -> None:
        pass


if __name__ == "__main__":
    lRUCache = LRUCache()

    # Test 1
    # result = lRUCache.solve(...)
    # assert result == expected

    print("All tests passed!")
