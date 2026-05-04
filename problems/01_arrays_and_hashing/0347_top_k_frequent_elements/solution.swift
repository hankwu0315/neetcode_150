// Problem: 347. Top K Frequent Elements
// Difficulty: Medium
// URL: https://leetcode.com/problems/top-k-frequent-elements/
//
// 【解法演進】排序 O(n log n) → 最小堆 O(n log k) → 桶排序 O(n)（最佳）
// 【最佳解核心思路】依頻率分桶（索引=頻率），由高頻向低頻取前 k。
// 【複雜度】時間：O(n)  空間：O(n)

import Foundation

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // TODO: implement
        return []
    }

    func topKFrequent_brute(_ nums: [Int], _ k: Int) -> [Int] {
        // TODO: implement
        return []
    }
}

func checkSet(_ actual: [Int], _ expected: [Int], _ name: String) {
    if actual.sorted() == expected.sorted() { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected.sorted()) but got \(actual.sorted())") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
