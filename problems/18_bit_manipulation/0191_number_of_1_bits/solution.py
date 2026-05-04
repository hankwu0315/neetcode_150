"""
Problem: 0191. Number of 1 Bits
"""


class Solution:
    def hammingWeight(self, n: int) -> int:
        c = 0
        while n:
            n &= n - 1
            c += 1
        return c


if __name__ == "__main__":
    sol = Solution()
    assert sol.hammingWeight(0b00000000000000000000000000001011) == 3
    assert sol.hammingWeight(0b00000000000000000000000010000000) == 1
    assert sol.hammingWeight(0b11111111111111111111111111111101) == 31
    assert sol.hammingWeight(0) == 0
    assert sol.hammingWeight(7) == 3
    print("All tests passed!")
