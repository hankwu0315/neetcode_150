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
        pass

    def checkInclusion_brute(self, s1: str, s2: str) -> bool:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
