"""
Problem: 242. Valid Anagram
Difficulty: Easy
URL: https://leetcode.com/problems/valid-anagram/

【解法演進】排序比較 O(n log n) → 計數陣列/字典 O(n)（最佳）
【最佳解核心思路】
    s 計數 +1、t 計數 -1，最後檢查全為 0；長度不同直接 False。
【複雜度】時間：O(n)  空間：O(1)（固定 26 槽）；Unicode 則 O(k)
"""
from collections import Counter


class Solution:
    # 最佳解：計數陣列
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False
        count = [0] * 26
        for cs, ct in zip(s, t):
            count[ord(cs) - ord('a')] += 1
            count[ord(ct) - ord('a')] -= 1
        return all(c == 0 for c in count)

    # Pythonic：Counter
    def isAnagram_counter(self, s: str, t: str) -> bool:
        return Counter(s) == Counter(t)

    # 暴力解：排序比較
    def isAnagram_brute(self, s: str, t: str) -> bool:
        return sorted(s) == sorted(t)


if __name__ == "__main__":
    s = Solution()

    assert s.isAnagram("anagram", "nagaram") is True, "Test 1 failed"
    assert s.isAnagram("rat", "car") is False, "Test 2 failed"
    assert s.isAnagram("", "") is True, "Test 3 failed (empty)"
    assert s.isAnagram("a", "a") is True, "Test 4 failed (single)"
    assert s.isAnagram("ab", "a") is False, "Test 5 failed (length diff)"
    assert s.isAnagram("aacc", "ccac") is False, "Test 6 failed (same len, diff count)"

    # 其他解法驗證
    assert s.isAnagram_counter("anagram", "nagaram") is True
    assert s.isAnagram_brute("rat", "car") is False

    print("All tests passed!")
