// 0190. Reverse Bits
import Foundation
class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = n, res = 0
        for _ in 0..<32 {
            res = (res << 1) | (n & 1)
            n >>= 1
        }
        return res
    }
}
let sol = Solution()
if sol.reverseBits(43261596) != 964176192 { fatalError("a") }
if sol.reverseBits(4294967293) != 3221225471 { fatalError("b") }
if sol.reverseBits(0) != 0 { fatalError("c") }
if sol.reverseBits(1) != 0x80000000 { fatalError("d") }
print("All tests passed!")
