"""
Problem: 0007. Reverse Integer
"""


class Solution:
    def reverse(self, x: int) -> int:
        sign = -1 if x < 0 else 1
        n = abs(x)
        r = 0
        while n:
            r = r * 10 + n % 10
            n //= 10
        r *= sign
        if r < -(2 ** 31) or r > 2 ** 31 - 1:
            return 0
        return r


if __name__ == "__main__":
    sol = Solution()
    assert sol.reverse(123) == 321
    assert sol.reverse(-123) == -321
    assert sol.reverse(120) == 21
    assert sol.reverse(0) == 0
    assert sol.reverse(1534236469) == 0
    assert sol.reverse(-2147483648) == 0
    print("All tests passed!")
