"""
Problem: 0647. Palindromic Substrings
"""


class Solution:
    def countSubstrings(self, s: str) -> int:
        cnt = 0

        def expand(l: int, r: int) -> int:
            c = 0
            while l >= 0 and r < len(s) and s[l] == s[r]:
                c += 1; l -= 1; r += 1
            return c

        for i in range(len(s)):
            cnt += expand(i, i)
            cnt += expand(i, i + 1)
        return cnt


if __name__ == "__main__":
    sol = Solution()
    assert sol.countSubstrings("abc") == 3
    assert sol.countSubstrings("aaa") == 6
    assert sol.countSubstrings("") == 0
    assert sol.countSubstrings("a") == 1
    assert sol.countSubstrings("aaaa") == 10
    assert sol.countSubstrings("abba") == 6
    print("All tests passed!")
