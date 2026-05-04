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
        lastSeen: dict[str, int] = {}
        l = 0
        best = 0
        for r, c in enumerate(s):
            if c in lastSeen and lastSeen[c] >= l:
                l = lastSeen[c] + 1
            lastSeen[c] = r
            if r - l + 1 > best:
                best = r - l + 1
        return best

    # 暴力解
    def lengthOfLongestSubstring_brute(self, s: str) -> int:
        best = 0
        n = len(s)
        for i in range(n):
            seen = set()
            for j in range(i, n):
                if s[j] in seen:
                    break
                seen.add(s[j])
                if j - i + 1 > best:
                    best = j - i + 1
        return best


if __name__ == "__main__":
    s = Solution()

    assert s.lengthOfLongestSubstring("abcabcbb") == 3, "Test 1 failed"
    assert s.lengthOfLongestSubstring("bbbbb") == 1, "Test 2 failed"
    assert s.lengthOfLongestSubstring("pwwkew") == 3, "Test 3 failed"
    assert s.lengthOfLongestSubstring("") == 0, "Test 4 failed (empty)"
    assert s.lengthOfLongestSubstring(" ") == 1, "Test 5 failed (space)"
    assert s.lengthOfLongestSubstring("dvdf") == 3, "Test 6 failed"
    assert s.lengthOfLongestSubstring("abcdef") == 6, "Test 7 failed (all unique)"

    assert s.lengthOfLongestSubstring_brute("abcabcbb") == 3, "Brute Test failed"

    print("All tests passed!")
