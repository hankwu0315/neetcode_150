"""
Problem: 0150. Evaluate Reverse Polish Notation
Difficulty: Medium
URL: https://leetcode.com/problems/evaluate-reverse-polish-notation/

解法演進：
1) 堆疊：數字 push；運算子 pop b, pop a, push (a op b)。
2) 除法以 int(a/b) 處理「向 0 截斷」（與 Python // 不同）。

最佳解核心思路：
- 後綴表示式的標準堆疊評估法。

複雜度：O(n) / O(n)。
"""


class Solution:
    def evalRPN(self, tokens: list[str]) -> int:
        stack: list[int] = []
        ops = {"+", "-", "*", "/"}
        for t in tokens:
            if t in ops:
                b = stack.pop()
                a = stack.pop()
                if t == "+":
                    stack.append(a + b)
                elif t == "-":
                    stack.append(a - b)
                elif t == "*":
                    stack.append(a * b)
                else:
                    stack.append(int(a / b))  # 向 0 截斷
            else:
                stack.append(int(t))
        return stack[0]

    # 等價寫法：用 dict + lambda（教學示範）
    def evalRPN_brute(self, tokens: list[str]) -> int:
        ops = {
            "+": lambda a, b: a + b,
            "-": lambda a, b: a - b,
            "*": lambda a, b: a * b,
            "/": lambda a, b: int(a / b),
        }
        stack: list[int] = []
        for t in tokens:
            if t in ops:
                b = stack.pop()
                a = stack.pop()
                stack.append(ops[t](a, b))
            else:
                stack.append(int(t))
        return stack[0]


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.evalRPN, sol.evalRPN_brute):
        assert fn(["2", "1", "+", "3", "*"]) == 9
        assert fn(["4", "13", "5", "/", "+"]) == 6
        assert fn(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]) == 22
        # 負數除法向 0 截斷
        assert fn(["6", "-132", "/"]) == 0
        assert fn(["-7", "2", "/"]) == -3  # int(-7/2) = -3
        # 單一數字
        assert fn(["3"]) == 3
    print("All tests passed!")
