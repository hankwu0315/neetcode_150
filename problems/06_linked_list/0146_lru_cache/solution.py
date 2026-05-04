"""
Problem: 0146. LRU Cache
Difficulty: Medium
URL: https://leetcode.com/problems/lru-cache/

解法：HashMap + 雙向鏈結串列，所有操作 O(1)。
"""


class _Node:
    __slots__ = ("key", "val", "prev", "next")

    def __init__(self, key=0, val=0):
        self.key = key
        self.val = val
        self.prev = None
        self.next = None


class LRUCache:
    def __init__(self, capacity: int):
        self.cap = capacity
        self.map: dict[int, _Node] = {}
        self.head = _Node()  # dummy head (most recent)
        self.tail = _Node()  # dummy tail (least recent)
        self.head.next = self.tail
        self.tail.prev = self.head

    def _remove(self, n: _Node) -> None:
        n.prev.next = n.next
        n.next.prev = n.prev

    def _add_front(self, n: _Node) -> None:
        n.prev = self.head
        n.next = self.head.next
        self.head.next.prev = n
        self.head.next = n

    def get(self, key: int) -> int:
        n = self.map.get(key)
        if not n:
            return -1
        self._remove(n)
        self._add_front(n)
        return n.val

    def put(self, key: int, value: int) -> None:
        if key in self.map:
            n = self.map[key]
            n.val = value
            self._remove(n)
            self._add_front(n)
            return
        n = _Node(key, value)
        self.map[key] = n
        self._add_front(n)
        if len(self.map) > self.cap:
            lru = self.tail.prev
            self._remove(lru)
            del self.map[lru.key]


if __name__ == "__main__":
    c = LRUCache(2)
    c.put(1, 1); c.put(2, 2)
    assert c.get(1) == 1
    c.put(3, 3); assert c.get(2) == -1
    c.put(4, 4); assert c.get(1) == -1
    assert c.get(3) == 3
    assert c.get(4) == 4

    # 更新值
    c2 = LRUCache(2)
    c2.put(1, 1); c2.put(2, 2)
    c2.put(1, 10); assert c2.get(1) == 10
    c2.put(3, 3)  # 應逐出 2（最舊）
    assert c2.get(2) == -1
    assert c2.get(1) == 10
    print("All tests passed!")
