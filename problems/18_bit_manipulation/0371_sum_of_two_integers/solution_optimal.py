"""
Problem: 0371. Sum of Two Integers
"""


class Solution:
    def getSum(self, a: int, b: int) -> int:
        mask = 0xFFFFFFFF
        while b & mask:
            carry = ((a & b) << 1) & mask
            a = (a ^ b) & mask
            b = carry
        return a if a <= 0x7FFFFFFF else ~(a ^ mask)


if __name__ == "__main__":
    sol = Solution()
    assert sol.getSum(1, 2) == 3
    assert sol.getSum(2, 3) == 5
    assert sol.getSum(-1, 1) == 0
    assert sol.getSum(-2, 3) == 1
    assert sol.getSum(0, 0) == 0
    assert sol.getSum(-5, -7) == -12
    print("All tests passed!")
