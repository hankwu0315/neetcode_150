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
        count = [0] * 26
        l = 0
        maxCount = 0
        best = 0
        A = ord("A")
        for r in range(len(s)):
            count[ord(s[r]) - A] += 1
            if count[ord(s[r]) - A] > maxCount:
                maxCount = count[ord(s[r]) - A]
            while (r - l + 1) - maxCount > k:
                count[ord(s[l]) - A] -= 1
                l += 1
            if r - l + 1 > best:
                best = r - l + 1
        return best

    # 暴力解：枚舉主導字母
    def characterReplacement_brute(self, s: str, k: int) -> int:
        best = 0
        for c in set(s):
            l = 0
            cost = 0  # 非 c 的字元數
            for r in range(len(s)):
                if s[r] != c:
                    cost += 1
                while cost > k:
                    if s[l] != c:
                        cost -= 1
                    l += 1
                if r - l + 1 > best:
                    best = r - l + 1
        return best


if __name__ == "__main__":
    s = Solution()

    assert s.characterReplacement("ABAB", 2) == 4, "Test 1 failed"
    assert s.characterReplacement("AABABBA", 1) == 4, "Test 2 failed"
    assert s.characterReplacement("A", 0) == 1, "Test 3 failed (single)"
    assert s.characterReplacement("AAAA", 2) == 4, "Test 4 failed (all same)"
    assert s.characterReplacement("ABCDE", 1) == 2, "Test 5 failed"
    assert s.characterReplacement("ABCDE", 0) == 1, "Test 6 failed (k=0)"

    assert s.characterReplacement_brute("AABABBA", 1) == 4, "Brute Test failed"

    print("All tests passed!")
