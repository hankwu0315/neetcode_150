// Problem: 0133. Clone Graph
// Difficulty: Medium

import Foundation

class GNode {
    var val: Int
    var neighbors: [GNode]
    init(_ v: Int, _ nbs: [GNode] = []) { val = v; neighbors = nbs }
}

class Solution {
    func cloneGraph(_ node: GNode?) -> GNode? {
        guard let node = node else { return nil }
        var mp: [ObjectIdentifier: GNode] = [:]
        func dfs(_ o: GNode) -> GNode {
            let id = ObjectIdentifier(o)
            if let ex = mp[id] { return ex }
            let c = GNode(o.val)
            mp[id] = c
            for nb in o.neighbors {
                c.neighbors.append(dfs(nb))
            }
            return c
        }
        return dfs(node)
    }
}

func buildG(_ adj: [[Int]]) -> GNode? {
    if adj.isEmpty { return nil }
    let nodes = (0..<adj.count).map { GNode($0 + 1) }
    for i in 0..<adj.count {
        nodes[i].neighbors = adj[i].map { nodes[$0 - 1] }
    }
    return nodes[0]
}

func adjOf(_ root: GNode?) -> [[Int]] {
    guard let root = root else { return [] }
    var seen: [Int: GNode] = [:]
    var st: [GNode] = [root]
    while let n = st.popLast() {
        if seen[n.val] != nil { continue }
        seen[n.val] = n
        for nb in n.neighbors { st.append(nb) }
    }
    let keys = seen.keys.sorted()
    return keys.map { v in seen[v]!.neighbors.map { $0.val }.sorted() }
}

func checkArr2(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
let r1 = buildG([[2, 4], [1, 3], [2, 4], [1, 3]])!
let c1 = sol.cloneGraph(r1)
if c1 === r1 { fatalError("a-same") }
checkArr2(adjOf(c1), [[2, 4], [1, 3], [2, 4], [1, 3]], "a")
let r2 = buildG([[]])!
let c2 = sol.cloneGraph(r2)
if c2 === r2 { fatalError("b-same") }
checkArr2(adjOf(c2), [[]], "b")
if sol.cloneGraph(nil) != nil { fatalError("c") }
let r3 = GNode(1)
r3.neighbors = [r3]
let c3 = sol.cloneGraph(r3)!
if c3 === r3 || c3.val != 1 || !(c3.neighbors[0] === c3) { fatalError("d") }
let r4 = buildG([[2], [1]])
checkArr2(adjOf(sol.cloneGraph(r4)), [[2], [1]], "e")
print("All tests passed!")
