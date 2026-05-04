// Problem: 0297. Serialize and Deserialize Binary Tree
// Difficulty: Hard

import Foundation

class TreeNode {
    var val: Int; var left: TreeNode?; var right: TreeNode?
    init(_ v: Int = 0, _ l: TreeNode? = nil, _ r: TreeNode? = nil) { val = v; left = l; right = r }
}

func fromLevel(_ a: [Int?]) -> TreeNode? {
    if a.isEmpty { return nil }
    let root = TreeNode(a[0]!); var q = [root]; var qi = 0, i = 1
    while qi < q.count && i < a.count {
        let n = q[qi]; qi += 1
        if i < a.count, let v = a[i] { n.left = TreeNode(v); q.append(n.left!) }
        i += 1
        if i < a.count, let v = a[i] { n.right = TreeNode(v); q.append(n.right!) }
        i += 1
    }
    return root
}

func toLevel(_ root: TreeNode?) -> [Int?] {
    guard let root = root else { return [] }
    var out: [Int?] = []
    var q: [TreeNode?] = [root]
    var i = 0
    while i < q.count {
        let n = q[i]; i += 1
        if n == nil { out.append(nil); continue }
        out.append(n!.val); q.append(n!.left); q.append(n!.right)
    }
    while !out.isEmpty && out.last! == nil { out.removeLast() }
    return out
}

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var out: [String] = []
        func dfs(_ n: TreeNode?) {
            if n == nil { out.append("#"); return }
            out.append("\(n!.val)")
            dfs(n!.left); dfs(n!.right)
        }
        dfs(root)
        return out.joined(separator: " ")
    }
    func deserialize(_ data: String) -> TreeNode? {
        if data.isEmpty { return nil }
        let tokens = data.split(separator: " ").map(String.init)
        var idx = 0
        func dfs() -> TreeNode? {
            let v = tokens[idx]; idx += 1
            if v == "#" { return nil }
            let n = TreeNode(Int(v)!)
            n.left = dfs(); n.right = dfs()
            return n
        }
        return dfs()
    }
}

func eqLevel(_ a: [Int?], _ b: [Int?]) -> Bool {
    if a.count != b.count { return false }
    for i in 0..<a.count { if a[i] != b[i] { return false } }
    return true
}

let c = Codec()
let cases: [[Int?]] = [
    [1, 2, 3, nil, nil, 4, 5],
    [],
    [1],
    [-1, -2, -3],
    [3, 9, 20, nil, nil, 15, 7],
    [1, 2, nil, 3, nil, 4, nil, 5],
]
for a in cases {
    let t = fromLevel(a)
    let s = c.serialize(t)
    let t2 = c.deserialize(s)
    if !eqLevel(toLevel(t2), a) { fatalError("FAIL \(a) / \(s) / \(toLevel(t2))") }
}
print("All tests passed!")
