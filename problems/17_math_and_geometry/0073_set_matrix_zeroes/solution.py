"""
Problem: 0073. Set Matrix Zeroes
"""
from typing import List


class Solution:
    def setZeroes(self, matrix: List[List[int]]) -> None:
        m, n = len(matrix), len(matrix[0])
        first_row = any(matrix[0][j] == 0 for j in range(n))
        first_col = any(matrix[i][0] == 0 for i in range(m))
        for i in range(1, m):
            for j in range(1, n):
                if matrix[i][j] == 0:
                    matrix[i][0] = 0
                    matrix[0][j] = 0
        for i in range(1, m):
            for j in range(1, n):
                if matrix[i][0] == 0 or matrix[0][j] == 0:
                    matrix[i][j] = 0
        if first_row:
            for j in range(n):
                matrix[0][j] = 0
        if first_col:
            for i in range(m):
                matrix[i][0] = 0


if __name__ == "__main__":
    sol = Solution()
    m1 = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
    sol.setZeroes(m1)
    assert m1 == [[1, 0, 1], [0, 0, 0], [1, 0, 1]]
    m2 = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]
    sol.setZeroes(m2)
    assert m2 == [[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]]
    m3 = [[1]]
    sol.setZeroes(m3)
    assert m3 == [[1]]
    print("All tests passed!")
