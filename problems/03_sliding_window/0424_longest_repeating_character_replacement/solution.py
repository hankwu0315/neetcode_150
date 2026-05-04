"""
Problem: 424. Longest Repeating Character Replacement
Difficulty: Medium
URL: https://leetcode.com/problems/longest-repeating-character-replacement/

【解法演進】枚舉主導字母 + 雙指標 O(26n) → 單一滑動窗口 O(n)（最佳）
【最佳解核心思路】
    維護窗口 + count[26] + maxCount；
    若 (r-l+1) - maxCount > k 則縮左界。maxCount 不嚴格下降亦正確。
【複雜度】時間：O(n)  空間：O(1)
"""

class Solution:
    # 最佳解
    def characterReplacement(self, s: str, k: int) -> int:
        pass

    def characterReplacement_brute(self, s: str, k: int) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
