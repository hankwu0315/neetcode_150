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
        var idx = [Int: Int]()
        for (i, v) in inorder.enumerated() { idx[v] = i }
        func build(_ pl: Int, _ pr: Int, _ il: Int, _ ir: Int) -> TreeNode? {
            if pl > pr { return nil }
            let root = TreeNode(preorder[pl])
            let i = idx[preorder[pl]]!
            let ls = i - il
            root.left = build(pl + 1, pl + ls, il, i - 1)
            root.right = build(pl + ls + 1, pr, i + 1, ir)
            return root
        }
        return build(0, preorder.count - 1, 0, inorder.count - 1)
    }
}

func checkLevel(_ a: [Int?], _ e: [Int?], _ msg: String) {
    if a.count != e.count { fatalError("FAIL \(msg): \(a) vs \(e)") }
    for i in 0..<a.count { if a[i] != e[i] { fatalError("FAIL \(msg): \(a) vs \(e)") } }
}

let sol = Solution()
checkLevel(toLevel(sol.buildTree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])), [3, 9, 20, nil, nil, 15, 7], "ex1")
checkLevel(toLevel(sol.buildTree([-1], [-1])), [-1], "one")
checkLevel(toLevel(sol.buildTree([1, 2], [2, 1])), [1, 2], "left only")
checkLevel(toLevel(sol.buildTree([1, 2], [1, 2])), [1, nil, 2], "right only")
checkLevel(toLevel(sol.buildTree([], [])), [], "empty")
print("All tests passed!")
