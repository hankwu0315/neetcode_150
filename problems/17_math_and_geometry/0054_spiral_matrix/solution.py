"""
Problem: 0054. Spiral Matrix
"""
from typing import List


class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        if not matrix or not matrix[0]:
            return []
        res = []
        top, bottom = 0, len(matrix) - 1
        left, right = 0, len(matrix[0]) - 1
        while top <= bottom and left <= right:
            for j in range(left, right + 1):
                res.append(matrix[top][j])
            top += 1
            for i in range(top, bottom + 1):
                res.append(matrix[i][right])
            right -= 1
            if top <= bottom:
                for j in range(right, left - 1, -1):
                    res.append(matrix[bottom][j])
                bottom -= 1
            if left <= right:
                for i in range(bottom, top - 1, -1):
                    res.append(matrix[i][left])
                left += 1
        return res


if __name__ == "__main__":
    sol = Solution()
    assert sol.spiralOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == [1, 2, 3, 6, 9, 8, 7, 4, 5]
    assert sol.spiralOrder([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]) == [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]
    assert sol.spiralOrder([[1]]) == [1]
    assert sol.spiralOrder([[1, 2], [3, 4]]) == [1, 2, 4, 3]
    assert sol.spiralOrder([[1], [2], [3]]) == [1, 2, 3]
    print("All tests passed!")
