"""
Problem: 3. Longest Substring Without Repeating Characters
Difficulty: Medium
URL: https://leetcode.com/problems/longest-substring-without-repeating-characters/

【解法演進】暴力 O(n²) → 滑動窗口 + HashMap O(n)（最佳）
【最佳解核心思路】
    紀錄每字元上次出現索引；遇到重複時把左界跳到 last + 1。
【複雜度】時間：O(n)  空間：O(min(n, |Σ|))
"""

class Solution:
    # 最佳解：滑動窗口
    def lengthOfLongestSubstring(self, s: str) -> int:
        pass

    def lengthOfLongestSubstring_brute(self, s: str) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
