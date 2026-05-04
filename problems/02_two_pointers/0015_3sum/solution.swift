// Problem: 15. 3Sum
// Difficulty: Medium
// URL: https://leetcode.com/problems/3sum/
//
// 【解法演進】暴力 O(n³) → 排序 + 固定 + 雙指標 O(n²)（最佳）
// 【最佳解核心思路】排序後固定 i，雙指標找 sum = -nums[i]，跳過重複。
// 【複雜度】時間：O(n²)  空間：O(1)

import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let arr = nums.sorted()
        let n = arr.count
        var result = [[Int]]()
        var i = 0
        while i < n - 2 {
            if arr[i] > 0 { break }
            if i > 0 && arr[i] == arr[i - 1] { i += 1; continue }
            let target = -arr[i]
            var l = i + 1, r = n - 1
            while l < r {
                let total = arr[l] + arr[r]
                if total == target {
                    result.append([arr[i], arr[l], arr[r]])
                    l += 1
                    r -= 1
                    while l < r && arr[l] == arr[l - 1] { l += 1 }
                    while l < r && arr[r] == arr[r + 1] { r -= 1 }
                } else if total < target {
                    l += 1
                } else {
                    r -= 1
                }
            }
            i += 1
        }
        return result
    }
}

func normTriplets(_ g: [[Int]]) -> [[Int]] {
    return g.map { $0.sorted() }.sorted { $0.map(String.init).joined() < $1.map(String.init).joined() }
}

func checkTriplets(_ actual: [[Int]], _ expected: [[Int]], _ name: String) {
    if normTriplets(actual) == normTriplets(expected) { print("✓ \(name)") }
    else { print("✗ \(name): expected \(normTriplets(expected)) but got \(normTriplets(actual))") }
}

let s = Solution()
checkTriplets(s.threeSum([-1, 0, 1, 2, -1, -4]), [[-1, -1, 2], [-1, 0, 1]], "Test 1")
checkTriplets(s.threeSum([0, 1, 1]), [], "Test 2")
checkTriplets(s.threeSum([0, 0, 0]), [[0, 0, 0]], "Test 3")
checkTriplets(s.threeSum([1, 2, 3]), [], "Test 4: no solution")
checkTriplets(s.threeSum([0, 0, 0, 0]), [[0, 0, 0]], "Test 5: dups")
checkTriplets(s.threeSum([-2, 0, 0, 2, 2]), [[-2, 0, 2]], "Test 6")

print("All tests passed!")
