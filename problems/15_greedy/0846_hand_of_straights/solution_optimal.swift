// 0846. Hand of Straights
import Foundation
class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        if hand.count % groupSize != 0 { return false }
        var cnt = [Int: Int]()
        for x in hand { cnt[x, default: 0] += 1 }
        for x in cnt.keys.sorted() {
            let c = cnt[x] ?? 0
            if c <= 0 { continue }
            for k in 0..<groupSize {
                let v = cnt[x + k] ?? 0
                if v < c { return false }
                cnt[x + k] = v - c
            }
        }
        return true
    }
}
let sol = Solution()
if sol.isNStraightHand([1, 2, 3, 6, 2, 3, 4, 7, 8], 3) != true { fatalError("a") }
if sol.isNStraightHand([1, 2, 3, 4, 5], 4) != false { fatalError("b") }
if sol.isNStraightHand([1, 2, 3, 4, 5, 6], 2) != true { fatalError("c") }
if sol.isNStraightHand([1], 1) != true { fatalError("d") }
if sol.isNStraightHand([8, 8, 9, 7, 7, 7, 6, 7, 9], 3) != false { fatalError("e") }
print("All tests passed!")
