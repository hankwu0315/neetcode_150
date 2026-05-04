"""
Problem: 0070. Climbing Stairs
"""


class Solution:
    def climbStairs(self, n: int) -> int:
        a, b = 1, 1
        for _ in range(n):
            a, b = b, a + b
        return a


if __name__ == "__main__":
    sol = Solution()
    assert sol.climbStairs(1) == 1
    assert sol.climbStairs(2) == 2
    assert sol.climbStairs(3) == 3
    assert sol.climbStairs(5) == 8
    assert sol.climbStairs(10) == 89
    assert sol.climbStairs(0) == 1
    print("All tests passed!")
