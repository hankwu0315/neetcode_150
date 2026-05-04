// Problem: 0226. Invert Binary Tree
// Difficulty: Easy

import Foundation

class TreeNode {
    var val: Int; var left: TreeNode?; var right: TreeNode?
    init(_ v: Int = 0, _ l: TreeNode? = nil, _ r: TreeNode? = nil) { val = v; left = l; right = r }
}

func fromLevel(_ a: [Int?]) -> TreeNode? {
    if a.isEmpty { return nil }
    let root = TreeNode(a[0]!)
    var q: [TreeNode] = [root]
    var qi = 0, i = 1
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
        out.append(n!.val)
        q.append(n!.left); q.append(n!.right)
    }
    while !out.isEmpty && out.last! == nil { out.removeLast() }
    return out
}

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        // TODO: implement
        return nil
    }
}

func checkLevel(_ a: [Int?], _ e: [Int?], _ msg: String) {
    if a.count != e.count { fatalError("FAIL \(msg): \(a) vs \(e)") }
    for i in 0..<a.count { if a[i] != e[i] { fatalError("FAIL \(msg): \(a) vs \(e)") } }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
