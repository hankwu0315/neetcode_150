// Problem: 36. Valid Sudoku
// Difficulty: Medium
// URL: https://leetcode.com/problems/valid-sudoku/
//
// 【解法演進】三趟檢查 → 一遍走訪 + 三組集合（最佳）
// 【最佳解核心思路】rows/cols/boxes 三組集合一起更新，b = (i/3)*3 + (j/3)。
// 【複雜度】時間：O(1)  空間：O(1)

import Foundation

class Solution {
    func isValidSudoku(_ board: [[String]]) -> Bool {
        var rows = [Set<String>](repeating: [], count: 9)
        var cols = [Set<String>](repeating: [], count: 9)
        var boxes = [Set<String>](repeating: [], count: 9)
        for i in 0..<9 {
            for j in 0..<9 {
                let c = board[i][j]
                if c == "." { continue }
                let b = (i / 3) * 3 + (j / 3)
                if rows[i].contains(c) || cols[j].contains(c) || boxes[b].contains(c) {
                    return false
                }
                rows[i].insert(c)
                cols[j].insert(c)
                boxes[b].insert(c)
            }
        }
        return true
    }
}

func checkBool(_ actual: Bool, _ expected: Bool, _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

let s = Solution()

let valid: [[String]] = [
    ["5", "3", ".", ".", "7", ".", ".", ".", "."],
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"],
]
var invalid = valid
invalid[0][0] = "8"

let empty: [[String]] = Array(repeating: Array(repeating: ".", count: 9), count: 9)

checkBool(s.isValidSudoku(valid), true, "Test 1: valid")
checkBool(s.isValidSudoku(invalid), false, "Test 2: column conflict")
checkBool(s.isValidSudoku(empty), true, "Test 3: empty")

var box = empty
box[0][0] = "5"
box[1][1] = "5"
checkBool(s.isValidSudoku(box), false, "Test 4: box conflict")

var row = empty
row[0][0] = "5"
row[0][8] = "5"
checkBool(s.isValidSudoku(row), false, "Test 5: row conflict")

print("All tests passed!")
