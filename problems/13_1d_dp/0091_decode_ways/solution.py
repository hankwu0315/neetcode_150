"""
Problem: 0091. Decode Ways
"""


class Solution:
    def numDecodings(self, s: str) -> int:
        n = len(s)
        if n == 0 or s[0] == '0':
            return 0
        prev2, prev1 = 1, 1
        for i in range(2, n + 1):
            cur = 0
            if s[i - 1] != '0':
                cur += prev1
            two = int(s[i - 2:i])
            if 10 <= two <= 26:
                cur += prev2
            prev2, prev1 = prev1, cur
        return prev1


if __name__ == "__main__":
    sol = Solution()
    assert sol.numDecodings("12") == 2
    assert sol.numDecodings("226") == 3
    assert sol.numDecodings("06") == 0
    assert sol.numDecodings("0") == 0
    assert sol.numDecodings("10") == 1
    assert sol.numDecodings("27") == 1
    assert sol.numDecodings("11106") == 2
    print("All tests passed!")
