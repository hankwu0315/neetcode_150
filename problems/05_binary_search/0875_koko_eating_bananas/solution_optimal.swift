// Problem: 0875. Koko Eating Bananas
// Difficulty: Medium

import Foundation

class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        func hours(_ k: Int) -> Int {
            var t = 0
            for p in piles { t += (p + k - 1) / k }
            return t
        }
        var l = 1, r = piles.max()!
        while l < r {
            let mid = l + (r - l) / 2
            if hours(mid) <= h { r = mid } else { l = mid + 1 }
        }
        return l
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.minEatingSpeed([3, 6, 7, 11], 8), 4, "ex1")
checkInt(sol.minEatingSpeed([30, 11, 23, 4, 20], 5), 30, "ex2")
checkInt(sol.minEatingSpeed([30, 11, 23, 4, 20], 6), 23, "ex3")
checkInt(sol.minEatingSpeed([1, 1, 1, 1], 4), 1, "h=n")
checkInt(sol.minEatingSpeed([10], 5), 2, "single1")
checkInt(sol.minEatingSpeed([10], 10), 1, "single2")
print("All tests passed!")
