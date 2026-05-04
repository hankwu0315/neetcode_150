"""
Problem: 0020. Valid Parentheses
Difficulty: Easy
URL: https://leetcode.com/problems/valid-parentheses/

解法演進：
1) 暴力：反覆移除相鄰配對 "()"、"[]"、"{}"，直到字串不變。O(n^2)。
2) 最佳：堆疊。左括號 push；右括號比對 top；結尾堆疊需空。O(n)。

最佳解核心思路：
- 用 dict 對應右→左括號，用堆疊維護尚未關閉的左括號。

複雜度：時間 O(n)，空間 O(n)。
"""


class Solution:
    # 最佳解：堆疊 O(n) / O(n)
    def isValid(self, s: str) -> bool:
        pairs = {")": "(", "]": "[", "}": "{"}
        stack: list[str] = []
        for ch in s:
            if ch in pairs:
                if not stack or stack[-1] != pairs[ch]:
                    return False
                stack.pop()
            else:
                stack.append(ch)
        return not stack

    # 暴力：反覆 replace O(n^2) / O(n)
    def isValid_brute(self, s: str) -> bool:
        prev = None
        while prev != s:
            prev = s
            s = s.replace("()", "").replace("[]", "").replace("{}", "")
        return s == ""


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.isValid, sol.isValid_brute):
        assert fn("()") is True
        assert fn("()[]{}") is True
        assert fn("(]") is False
        assert fn("([)]") is False
        assert fn("{[]}") is True
        assert fn("") is True
        assert fn("(") is False
        assert fn("]") is False
    print("All tests passed!")
