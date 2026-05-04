// Problem: 0004. Median of Two Sorted Arrays
// Difficulty: Hard

import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var a = nums1, b = nums2
        if a.count > b.count { swap(&a, &b) }
        let m = a.count, n = b.count
        let half = (m + n + 1) / 2
        let INF = Int.max / 2
        var l = 0, r = m
        while l <= r {
            let i = (l + r) / 2
            let j = half - i
            let l1 = i > 0 ? a[i - 1] : -INF
            let r1 = i < m ? a[i] : INF
            let l2 = j > 0 ? b[j - 1] : -INF
            let r2 = j < n ? b[j] : INF
            if l1 <= r2 && l2 <= r1 {
                if (m + n) % 2 == 1 {
                    return Double(max(l1, l2))
                }
                return Double(max(l1, l2) + min(r1, r2)) / 2.0
            }
            if l1 > r2 { r = i - 1 } else { l = i + 1 }
        }
        return 0.0
    }
}

func checkDouble(_ a: Double, _ e: Double, _ msg: String) {
    if abs(a - e) > 1e-9 { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkDouble(sol.findMedianSortedArrays([1, 3], [2]), 2.0, "ex1")
checkDouble(sol.findMedianSortedArrays([1, 2], [3, 4]), 2.5, "ex2")
checkDouble(sol.findMedianSortedArrays([], [1]), 1.0, "left empty")
checkDouble(sol.findMedianSortedArrays([2], []), 2.0, "right empty")
checkDouble(sol.findMedianSortedArrays([1, 2], [3, 4, 5]), 3.0, "odd")
checkDouble(sol.findMedianSortedArrays([1, 2, 3], [10, 20, 30]), 6.5, "no overlap")
checkDouble(sol.findMedianSortedArrays([-5, -3], [-2, 0]), -2.5, "neg")
print("All tests passed!")
