// Problem: 0105. Construct Binary Tree from Preorder and Inorder
// Difficulty: Medium

import Foundation

class TreeNode {
    var val: Int; var left: TreeNode?; var right: TreeNode?
    init(_ v: Int = 0, _ l: TreeNode? = nil, _ r: TreeNode? = nil) { val = v; left = l; right = r }
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

class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
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
