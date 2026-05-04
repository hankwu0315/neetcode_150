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
        self.stack: list[int] = []
        self.min_stack: list[int] = []

    def push(self, val: int) -> None:
        self.stack.append(val)
        if not self.min_stack or val <= self.min_stack[-1]:
            self.min_stack.append(val)

    def pop(self) -> None:
        v = self.stack.pop()
        if v == self.min_stack[-1]:
            self.min_stack.pop()

    def top(self) -> int:
        return self.stack[-1]

    def getMin(self) -> int:
        return self.min_stack[-1]


# 解法 2：每個元素存 (val, min)
class MinStackPaired:
    def __init__(self) -> None:
        self.s: list[tuple[int, int]] = []

    def push(self, val: int) -> None:
        m = val if not self.s else min(val, self.s[-1][1])
        self.s.append((val, m))

    def pop(self) -> None:
        self.s.pop()

    def top(self) -> int:
        return self.s[-1][0]

    def getMin(self) -> int:
        return self.s[-1][1]


if __name__ == "__main__":
    for cls in (MinStack, MinStackPaired):
        ms = cls()
        ms.push(-2); ms.push(0); ms.push(-3)
        assert ms.getMin() == -3
        ms.pop()
        assert ms.top() == 0
        assert ms.getMin() == -2

        # 重複最小值
        ms = cls()
        ms.push(1); ms.push(1); ms.push(1)
        assert ms.getMin() == 1
        ms.pop(); assert ms.getMin() == 1
        ms.pop(); assert ms.getMin() == 1

        # 單一元素
        ms = cls()
        ms.push(5)
        assert ms.top() == 5 and ms.getMin() == 5
    print("All tests passed!")
