"""
Problem: 0155. Min Stack
Difficulty: Medium
URL: https://leetcode.com/problems/min-stack/

解法演進：
1) 兩個堆疊：min_stack 只在「<= 當前最小」時推入。最佳。
2) 每筆存 (val, min_so_far)：每個 push 都同步算最小。

最佳解核心思路：
- 輔助堆疊維護「目前堆疊範圍內的最小值序列」，使 getMin O(1)。

複雜度：每個操作 O(1)，空間 O(n)。
"""

class MinStack:
    def __init__(self) -> None:
        pass

    def push(self, val: int) -> None:
        pass

    def pop(self) -> None:
        pass

    def top(self) -> int:
        pass

    def getMin(self) -> int:
        pass


class MinStackPaired:
    def __init__(self) -> None:
        pass

    def push(self, val: int) -> None:
        pass

    def pop(self) -> None:
        pass

    def top(self) -> int:
        pass

    def getMin(self) -> int:
        pass


if __name__ == "__main__":
    minStack = MinStack()

    # Test 1
    # result = minStack.solve(...)
    # assert result == expected

    print("All tests passed!")
