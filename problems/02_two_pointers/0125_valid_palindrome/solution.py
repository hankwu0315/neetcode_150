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
        pass

    def isPalindrome_brute(self, s: str) -> bool:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
