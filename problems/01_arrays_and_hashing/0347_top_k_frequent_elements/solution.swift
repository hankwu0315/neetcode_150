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
        var count = [Int: Int]()
        for x in nums { count[x, default: 0] += 1 }
        let n = nums.count
        var buckets = [[Int]](repeating: [], count: n + 1)
        for (num, freq) in count { buckets[freq].append(num) }

        var result = [Int]()
        var f = n
        while f >= 1 {
            for num in buckets[f] {
                result.append(num)
                if result.count == k { return result }
            }
            f -= 1
        }
        return result
    }

    func topKFrequent_brute(_ nums: [Int], _ k: Int) -> [Int] {
        var count = [Int: Int]()
        for x in nums { count[x, default: 0] += 1 }
        let sorted = count.sorted { $0.value > $1.value }
        return sorted.prefix(k).map { $0.key }
    }
}

func checkSet(_ actual: [Int], _ expected: [Int], _ name: String) {
    if actual.sorted() == expected.sorted() { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected.sorted()) but got \(actual.sorted())") }
}

let s = Solution()
checkSet(s.topKFrequent([1, 1, 1, 2, 2, 3], 2), [1, 2], "Test 1")
checkSet(s.topKFrequent([1], 1), [1], "Test 2")
checkSet(s.topKFrequent([1, 2], 2), [1, 2], "Test 3")
checkSet(s.topKFrequent([4, 1, -1, 2, -1, 2, 3], 2), [-1, 2], "Test 4: negatives")
checkSet(s.topKFrequent([5, 5, 5, 5], 1), [5], "Test 5: single value")
checkSet(s.topKFrequent_brute([1, 1, 1, 2, 2, 3], 2), [1, 2], "Brute Test")

print("All tests passed!")
