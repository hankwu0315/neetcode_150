// Problem: 239. Sliding Window Maximum
// Difficulty: Hard
// URL: https://leetcode.com/problems/sliding-window-maximum/
//
// 【解法演進】暴力 → 最大堆 → 單調遞減 deque（最佳）
// 【最佳解核心思路】deque 存索引，右端彈 <=nums[r]，左端彈過期。
// 【複雜度】時間：O(n)  空間：O(k)

import Foundation

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var dq = [Int]()  // 用 array 模擬 deque：head 指標
        var head = 0
        var ans = [Int]()
        for r in 0..<nums.count {
            while head < dq.count && nums[dq.last!] <= nums[r] { dq.removeLast() }
            dq.append(r)
            if dq[head] < r - k + 1 { head += 1 }
            if r >= k - 1 { ans.append(nums[dq[head]]) }
        }
        return ans
    }
}

func checkArr(_ actual: [Int], _ expected: [Int], _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

let s = Solution()
checkArr(s.maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3), [3, 3, 5, 5, 6, 7], "Test 1")
checkArr(s.maxSlidingWindow([1], 1), [1], "Test 2")
checkArr(s.maxSlidingWindow([1, -1], 1), [1, -1], "Test 3")
checkArr(s.maxSlidingWindow([9, 11], 2), [11], "Test 4")
checkArr(s.maxSlidingWindow([4, -2], 2), [4], "Test 5")
checkArr(s.maxSlidingWindow([7, 2, 4], 2), [7, 4], "Test 6")

print("All tests passed!")
