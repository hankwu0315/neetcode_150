"""
Problem: 0074. Search a 2D Matrix
Difficulty: Medium
URL: https://leetcode.com/problems/search-a-2d-matrix/

解法演進：
1) 暴力 O(m*n)。
2) 兩次二分 O(log m + log n)。
3) 視為一維二分 O(log(m*n))（最簡）。

最佳解核心思路：
- 攤平後嚴格遞增，直接做一維二分；座標換算 mid -> (mid//n, mid%n)。

複雜度：O(log(m*n)) / O(1)。
"""


class Solution:
    # 最佳解：一維二分
    def searchMatrix(self, matrix: list[list[int]], target: int) -> bool:
        if not matrix or not matrix[0]:
            return False
        m, n = len(matrix), len(matrix[0])
        l, r = 0, m * n - 1
        while l <= r:
            mid = l + (r - l) // 2
            v = matrix[mid // n][mid % n]
            if v == target:
                return True
            if v < target:
                l = mid + 1
            else:
                r = mid - 1
        return False

    # 暴力對照
    def searchMatrix_brute(self, matrix: list[list[int]], target: int) -> bool:
        for row in matrix:
            for v in row:
                if v == target:
                    return True
        return False


if __name__ == "__main__":
    sol = Solution()
    M = [[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 60]]
    for fn in (sol.searchMatrix, sol.searchMatrix_brute):
        assert fn(M, 3) is True
        assert fn(M, 13) is False
        assert fn(M, 1) is True
        assert fn(M, 60) is True
        assert fn(M, 0) is False
        assert fn(M, 100) is False
        # 單元素
        assert fn([[5]], 5) is True
        assert fn([[5]], 3) is False
        # 單列
        assert fn([[1, 2, 3]], 2) is True
    print("All tests passed!")
