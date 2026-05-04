// Problem: 49. Group Anagrams
// Difficulty: Medium
// URL: https://leetcode.com/problems/group-anagrams/
//
// 【解法演進】排序當 key O(n·k log k) → 26 元組計數 key O(n·k)（最佳）
// 【最佳解核心思路】每字串以 26 計數陣列作 key 歸類。
// 【複雜度】時間：O(n · k)  空間：O(n · k)

import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups: [String: [String]] = [:]
        let aScalar = Int(Character("a").asciiValue!)
        for s in strs {
            var count = [Int](repeating: 0, count: 26)
            for u in s.unicodeScalars { count[Int(u.value) - aScalar] += 1 }
            let key = count.map(String.init).joined(separator: ",")
            groups[key, default: []].append(s)
        }
        return Array(groups.values)
    }

    func groupAnagrams_brute(_ strs: [String]) -> [[String]] {
        var groups: [String: [String]] = [:]
        for s in strs {
            let key = String(s.sorted())
            groups[key, default: []].append(s)
        }
        return Array(groups.values)
    }
}

func normGroups(_ g: [[String]]) -> [[String]] {
    return g.map { $0.sorted() }.sorted { $0.joined(separator: ",") < $1.joined(separator: ",") }
}

func checkGroups(_ actual: [[String]], _ expected: [[String]], _ name: String) {
    let a = normGroups(actual)
    let b = normGroups(expected)
    if a == b { print("✓ \(name)") }
    else { print("✗ \(name): expected \(b) but got \(a)") }
}

let s = Solution()
checkGroups(
    s.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]),
    [["bat"], ["nat", "tan"], ["ate", "eat", "tea"]],
    "Test 1"
)
checkGroups(s.groupAnagrams([""]), [[""]], "Test 2: empty")
checkGroups(s.groupAnagrams(["a"]), [["a"]], "Test 3: single")
checkGroups(s.groupAnagrams(["abc", "bca", "cab"]), [["abc", "bca", "cab"]], "Test 4")
checkGroups(s.groupAnagrams(["a", "b", "c"]), [["a"], ["b"], ["c"]], "Test 5: no anagrams")
checkGroups(s.groupAnagrams_brute(["eat", "tea", "ate"]), [["ate", "eat", "tea"]], "Brute Test")

print("All tests passed!")
