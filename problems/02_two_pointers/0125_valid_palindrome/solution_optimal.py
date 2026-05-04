"""
Problem: 125. Valid Palindrome
Difficulty: Easy
URL: https://leetcode.com/problems/valid-palindrome/

【解法演進】清理 + 反轉比較 O(n)/O(n) → 雙指標原地比較 O(n)/O(1)（最佳）
【最佳解核心思路】
    左右指標相向而行，跳過非英數字元，逐對比較（小寫不敏感）。
【複雜度】時間：O(n)  空間：O(1)
"""


class Solution:
    # 最佳解：雙指標
    def isPalindrome(self, s: str) -> bool:
        l, r = 0, len(s) - 1
        while l < r:
            while l < r and not s[l].isalnum():
                l += 1
            while l < r and not s[r].isalnum():
                r -= 1
            if s[l].lower() != s[r].lower():
                return False
            l += 1
            r -= 1
        return True

    # 暴力解：清理 + 反轉
    def isPalindrome_brute(self, s: str) -> bool:
        t = "".join(c.lower() for c in s if c.isalnum())
        return t == t[::-1]


if __name__ == "__main__":
    s = Solution()

    assert s.isPalindrome("A man, a plan, a canal: Panama") is True, "Test 1 failed"
    assert s.isPalindrome("race a car") is False, "Test 2 failed"
    assert s.isPalindrome(" ") is True, "Test 3 failed (empty after clean)"
    assert s.isPalindrome("") is True, "Test 4 failed (empty)"
    assert s.isPalindrome("0P") is False, "Test 5 failed (digit vs letter)"
    assert s.isPalindrome("a.") is True, "Test 6 failed (single alnum)"
    assert s.isPalindrome("ab") is False, "Test 7 failed"

    assert s.isPalindrome_brute("A man, a plan, a canal: Panama") is True
    assert s.isPalindrome_brute("race a car") is False

    print("All tests passed!")
