// Problem: 0269. Alien Dictionary
// Difficulty: Hard

import Foundation

class Solution {
    func alienOrder(_ words: [String]) -> String {
        var graph: [Character: Set<Character>] = [:]
        var indeg: [Character: Int] = [:]
        for w in words {
            for c in w {
                if graph[c] == nil { graph[c] = []; indeg[c] = 0 }
            }
        }
        for i in 0..<(words.count - 1) {
            let a = Array(words[i]), b = Array(words[i + 1])
            let ml = min(a.count, b.count)
            if a.count > b.count && Array(a.prefix(ml)) == Array(b.prefix(ml)) {
                return ""
            }
            for j in 0..<ml {
                if a[j] != b[j] {
                    if !graph[a[j]]!.contains(b[j]) {
                        graph[a[j]]!.insert(b[j])
                        indeg[b[j]]! += 1
                    }
                    break
                }
            }
        }
        var q: [Character] = []
        for (k, v) in indeg where v == 0 { q.append(k) }
        var head = 0
        var out = ""
        while head < q.count {
            let c = q[head]; head += 1
            out.append(c)
            for nb in graph[c]! {
                indeg[nb]! -= 1
                if indeg[nb]! == 0 { q.append(nb) }
            }
        }
        return out.count == indeg.count ? out : ""
    }
}

func validAlienOrder(_ order: String, _ words: [String]) -> Bool {
    var seen: Set<Character> = []
    for w in words { for c in w { seen.insert(c) } }
    if Set(order) != seen { return false }
    var pos: [Character: Int] = [:]
    for (i, c) in order.enumerated() { pos[c] = i }
    for i in 0..<(words.count - 1) {
        let a = Array(words[i]), b = Array(words[i + 1])
        let ml = min(a.count, b.count)
        var diff = -1
        for j in 0..<ml { if a[j] != b[j] { diff = j; break } }
        if diff == -1 {
            if a.count > b.count { return false }
            continue
        }
        if (pos[a[diff]] ?? -1) >= (pos[b[diff]] ?? -1) { return false }
    }
    return true
}

let sol = Solution()
let o1 = sol.alienOrder(["wrt", "wrf", "er", "ett", "rftt"])
if !validAlienOrder(o1, ["wrt", "wrf", "er", "ett", "rftt"]) { fatalError("a") }
if sol.alienOrder(["z", "x"]) != "zx" { fatalError("b") }
if sol.alienOrder(["z", "x", "z"]) != "" { fatalError("c") }
if sol.alienOrder(["abc", "ab"]) != "" { fatalError("d") }
if sol.alienOrder(["a"]) != "a" { fatalError("e") }
let o6 = sol.alienOrder(["ab", "adc"])
if !validAlienOrder(o6, ["ab", "adc"]) { fatalError("f") }
print("All tests passed!")
