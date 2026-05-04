"""
Problem: 567. Permutation in String
Difficulty: Medium
URL: https://leetcode.com/problems/permutation-in-string/

【解法演進】排序比對 O(n·k log k) → 計數比較 O(26n) → 固定窗口 + matches 變數 O(n)（最佳）
【最佳解核心思路】
    維護兩個 26 元計數，並用 matches 紀錄相等的字母數；
    滑窗時對加入/移除的字母依「相等狀態翻轉」更新 matches。
【複雜度】時間：O(n)  空間：O(1)
"""


class Solution:
    # 最佳解
    def checkInclusion(self, s1: str, s2: str) -> bool:
        if len(s1) > len(s2):
            return False
        A = ord("a")
        c1 = [0] * 26
        c2 = [0] * 26
        for i in range(len(s1)):
            c1[ord(s1[i]) - A] += 1
            c2[ord(s2[i]) - A] += 1
        matches = sum(1 for i in range(26) if c1[i] == c2[i])
        if matches == 26:
            return True
        for r in range(len(s1), len(s2)):
            # 加入 s2[r]
            idx = ord(s2[r]) - A
            before = c2[idx] == c1[idx]
            c2[idx] += 1
            after = c2[idx] == c1[idx]
            if before != after:
                matches += 1 if after else -1
            # 移出 s2[r - len(s1)]
            idx = ord(s2[r - len(s1)]) - A
            before = c2[idx] == c1[idx]
            c2[idx] -= 1
            after = c2[idx] == c1[idx]
            if before != after:
                matches += 1 if after else -1
            if matches == 26:
                return True
        return False

    # 暴力解：每窗口計數比較
    def checkInclusion_brute(self, s1: str, s2: str) -> bool:
        if len(s1) > len(s2):
            return False
        A = ord("a")
        c1 = [0] * 26
        for c in s1:
            c1[ord(c) - A] += 1
        for i in range(len(s2) - len(s1) + 1):
            c2 = [0] * 26
            for c in s2[i : i + len(s1)]:
                c2[ord(c) - A] += 1
            if c1 == c2:
                return True
        return False


if __name__ == "__main__":
    s = Solution()

    assert s.checkInclusion("ab", "eidbaooo") is True, "Test 1 failed"
    assert s.checkInclusion("ab", "eidboaoo") is False, "Test 2 failed"
    assert s.checkInclusion("a", "a") is True, "Test 3 failed"
    assert s.checkInclusion("ab", "a") is False, "Test 4 failed (s1 longer)"
    assert s.checkInclusion("abc", "ccccbbbbaaaa") is False, "Test 5 failed"
    assert s.checkInclusion("hello", "ooolleoooleh") is False, "Test 6 failed"
    assert s.checkInclusion("adc", "dcda") is True, "Test 7 failed"

    assert s.checkInclusion_brute("ab", "eidbaooo") is True, "Brute Test failed"

    print("All tests passed!")
