// Problem: 0138. Copy List with Random Pointer
// Difficulty: Medium

import Foundation

class RNode {
    var val: Int; var next: RNode?; var random: RNode?
    init(_ v: Int) { val = v }
}

func build(_ arr: [(Int, Int?)]) -> RNode? {
    if arr.isEmpty { return nil }
    let nodes = arr.map { RNode($0.0) }
    for i in 0..<(nodes.count - 1) { nodes[i].next = nodes[i + 1] }
    for (i, p) in arr.enumerated() {
        if let r = p.1 { nodes[i].random = nodes[r] }
    }
    return nodes[0]
}

func serialize(_ h: RNode?) -> [(Int, Int?)] {
    var nodes: [RNode] = []
    var idx: [ObjectIdentifier: Int] = [:]
    var c = h
    while c != nil { idx[ObjectIdentifier(c!)] = nodes.count; nodes.append(c!); c = c!.next }
    return nodes.map { n in
        (n.val, n.random == nil ? nil : idx[ObjectIdentifier(n.random!)])
    }
}

class Solution {
    func copyRandomList(_ head: RNode?) -> RNode? {
        guard let head = head else { return nil }
        var m: [ObjectIdentifier: RNode] = [:]
        var c: RNode? = head
        while c != nil {
            m[ObjectIdentifier(c!)] = RNode(c!.val)
            c = c!.next
        }
        var cur: RNode? = head
        while cur != nil {
            let n = m[ObjectIdentifier(cur!)]!
            n.next = cur!.next == nil ? nil : m[ObjectIdentifier(cur!.next!)]
            n.random = cur!.random == nil ? nil : m[ObjectIdentifier(cur!.random!)]
            cur = cur!.next
        }
        return m[ObjectIdentifier(head)]
    }
}

func eq(_ a: [(Int, Int?)], _ b: [(Int, Int?)]) -> Bool {
    if a.count != b.count { return false }
    for i in 0..<a.count {
        if a[i].0 != b[i].0 || a[i].1 != b[i].1 { return false }
    }
    return true
}

let sol = Solution()
let cases: [[(Int, Int?)]] = [
    [(7, nil), (13, 0), (11, 4), (10, 2), (1, 0)],
    [(1, 1), (2, 1)],
    [(3, nil), (3, 0), (3, nil)],
    [],
]
for arr in cases {
    let h = build(arr)
    let c = sol.copyRandomList(h)
    if !eq(serialize(c), arr) { fatalError("FAIL serialize") }
}
print("All tests passed!")
