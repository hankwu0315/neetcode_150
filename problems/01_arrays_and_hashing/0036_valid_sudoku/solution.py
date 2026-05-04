"""
Problem: 36. Valid Sudoku
Difficulty: Medium
URL: https://leetcode.com/problems/valid-sudoku/

【解法演進】三趟分別檢查 → 一遍走訪 + 三組集合（最佳）
【最佳解核心思路】
    維護 rows[9]、cols[9]、boxes[9] 三組集合，遍歷每格時同時更新與檢查。
    子方格索引 b = (i // 3) * 3 + (j // 3)。
【複雜度】時間：O(1)（81 格固定）  空間：O(1)
"""

from typing import List

class Solution:
    # 最佳解：一遍走訪
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        pass

    def isValidSudoku_brute(self, board: List[List[str]]) -> bool:
        # 列
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
