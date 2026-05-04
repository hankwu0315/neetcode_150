"""
Problem: 0981. Time Based Key-Value Store
Difficulty: Medium
URL: https://leetcode.com/problems/time-based-key-value-store/

解法演進：
1) 暴力 get 線性 O(n)。
2) 每 key 一個升序陣列 + 二分：set O(1), get O(log n)。

最佳解核心思路：
- set 時間戳嚴格遞增 -> 陣列自然有序，可直接二分找 <= timestamp 的最右位置。

複雜度：set O(1)，get O(log n)。
"""


class TimeMap:
    def __init__(self) -> None:
        self.store: dict[str, list[tuple[int, str]]] = {}

    def set(self, key: str, value: str, timestamp: int) -> None:
        self.store.setdefault(key, []).append((timestamp, value))

    def get(self, key: str, timestamp: int) -> str:
        arr = self.store.get(key)
        if not arr:
            return ""
        l, r = 0, len(arr) - 1
        ans = ""
        while l <= r:
            mid = l + (r - l) // 2
            if arr[mid][0] <= timestamp:
                ans = arr[mid][1]
                l = mid + 1
            else:
                r = mid - 1
        return ans


if __name__ == "__main__":
    tm = TimeMap()
    tm.set("foo", "bar", 1)
    assert tm.get("foo", 1) == "bar"
    assert tm.get("foo", 3) == "bar"
    tm.set("foo", "bar2", 4)
    assert tm.get("foo", 4) == "bar2"
    assert tm.get("foo", 5) == "bar2"
    # 比所有 timestamp 都早
    assert tm.get("foo", 0) == ""
    # 不存在的 key
    assert tm.get("missing", 10) == ""

    # 多 key 不混淆
    tm.set("a", "v1", 2)
    tm.set("a", "v2", 5)
    assert tm.get("a", 4) == "v1"
    assert tm.get("a", 5) == "v2"
    assert tm.get("a", 100) == "v2"
    print("All tests passed!")
