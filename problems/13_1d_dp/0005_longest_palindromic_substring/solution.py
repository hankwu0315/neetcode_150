"""
Problem: 0005. Longest Palindromic Substring
"""


class Solution:
    def longestPalindrome(self, s: str) -> str:
        if not s:
            return ""
        bl, br = 0, 0

        def expand(l: int, r: int) -> None:
            nonlocal bl, br
            while l >= 0 and r < len(s) and s[l] == s[r]:
                l -= 1
                r += 1
            l += 1
            r -= 1
            if r - l > br - bl:
                bl, br = l, r

        for i in range(len(s)):
            expand(i, i)
            expand(i, i + 1)
        return s[bl:br + 1]


if __name__ == "__main__":
    sol = Solution()
    assert sol.longestPalindrome("babad") in ("bab", "aba")
    assert sol.longestPalindrome("cbbd") == "bb"
    assert sol.longestPalindrome("a") == "a"
    assert sol.longestPalindrome("") == ""
    assert sol.longestPalindrome("ac") in ("a", "c")
    assert sol.longestPalindrome("racecar") == "racecar"
    print("All tests passed!")
