// Problem: 0332. Reconstruct Itinerary
// Difficulty: Hard

import Foundation

class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var g: [String: [String]] = [:]
        for t in tickets { g[t[0], default: []].append(t[1]) }
        for k in g.keys { g[k]!.sort(by: >) } // 反向排序，pop end = 字典序最小
        var out: [String] = []
        func dfs(_ u: String) {
            while g[u] != nil && !g[u]!.isEmpty {
                let v = g[u]!.removeLast()
                dfs(v)
            }
            out.append(u)
        }
        dfs("JFK")
        return out.reversed()
    }
}

func checkArrS(_ a: [String], _ e: [String], _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkArrS(sol.findItinerary([
    ["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]
]), ["JFK", "MUC", "LHR", "SFO", "SJC"], "a")
checkArrS(sol.findItinerary([
    ["JFK", "SFO"], ["JFK", "ATL"], ["SFO", "ATL"],
    ["ATL", "JFK"], ["ATL", "SFO"]
]), ["JFK", "ATL", "JFK", "SFO", "ATL", "SFO"], "b")
checkArrS(sol.findItinerary([["JFK", "KUL"], ["JFK", "NRT"], ["NRT", "JFK"]]),
    ["JFK", "NRT", "JFK", "KUL"], "c")
checkArrS(sol.findItinerary([["JFK", "A"]]), ["JFK", "A"], "d")
checkArrS(sol.findItinerary([["JFK", "B"], ["JFK", "A"], ["A", "JFK"]]),
    ["JFK", "A", "JFK", "B"], "e")
print("All tests passed!")
