"""
Problem: 0190. Reverse Bits
"""


class Solution:
    def reverseBits(self, n: int) -> int:
        res = 0
        for _ in range(32):
            res = (res << 1) | (n & 1)
            n >>= 1
        return res


if __name__ == "__main__":
    sol = Solution()
    assert sol.reverseBits(0b00000010100101000001111010011100) == 964176192
    assert sol.reverseBits(0b11111111111111111111111111111101) == 3221225471
    assert sol.reverseBits(0) == 0
    assert sol.reverseBits(1) == 0x80000000
    print("All tests passed!")
