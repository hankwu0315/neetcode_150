// 0763. Partition Labels
import Foundation
class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        let a = Array(s)
        var last = [Character: Int]()
        for i in 0..<a.count { last[a[i]] = i }
        var res = [Int]()
        var start = 0, end = 0
        for i in 0..<a.count {
            if let v = last[a[i]], v > end { end = v }
            if i == end { res.append(end - start + 1); start = i + 1 }
        }
        return res
    }
}
let sol = Solution()
if sol.partitionLabels("ababcbacadefegdehijhklij") != [9, 7, 8] { fatalError("a") }
if sol.partitionLabels("eccbbbbdec") != [10] { fatalError("b") }
if sol.partitionLabels("a") != [1] { fatalError("c") }
if sol.partitionLabels("abc") != [1, 1, 1] { fatalError("d") }
if sol.partitionLabels("aaabbb") != [3, 3] { fatalError("e") }
print("All tests passed!")
