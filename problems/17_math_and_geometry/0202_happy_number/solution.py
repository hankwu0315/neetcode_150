"""
Problem: 0202. Happy Number
"""


class Solution:
    def isHappy(self, n: int) -> bool:
        def sq(x: int) -> int:
            s = 0
            while x:
                d = x % 10
                s += d * d
                x //= 10
            return s
        slow, fast = n, sq(n)
        while fast != 1 and slow != fast:
            slow = sq(slow)
            fast = sq(sq(fast))
        return fast == 1


if __name__ == "__main__":
    sol = Solution()
    assert sol.isHappy(19) is True
    assert sol.isHappy(2) is False
    assert sol.isHappy(1) is True
    assert sol.isHappy(7) is True
    assert sol.isHappy(20) is False
    print("All tests passed!")
