"""
Problem: 0050. Pow(x, n)
"""


class Solution:
    def myPow(self, x: float, n: int) -> float:
        if n < 0:
            x = 1 / x
            n = -n
        res = 1.0
        base = x
        while n > 0:
            if n & 1:
                res *= base
            base *= base
            n >>= 1
        return res


if __name__ == "__main__":
    sol = Solution()
    assert abs(sol.myPow(2.0, 10) - 1024.0) < 1e-6
    assert abs(sol.myPow(2.1, 3) - 9.261) < 1e-6
    assert abs(sol.myPow(2.0, -2) - 0.25) < 1e-6
    assert abs(sol.myPow(1.0, 0) - 1.0) < 1e-6
    assert abs(sol.myPow(0.5, 4) - 0.0625) < 1e-6
    print("All tests passed!")
