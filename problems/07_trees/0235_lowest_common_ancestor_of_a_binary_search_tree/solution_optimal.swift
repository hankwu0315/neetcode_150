// Problem: 0235. Lowest Common Ancestor of a BST
// Difficulty: Medium

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

func find(_ root: TreeNode?, _ v: Int) -> TreeNode? {
    var cur = root
    while let c = cur {
        if c.val == v { return c }
        cur = v < c.val ? c.left : c.right
    }
    return nil
}

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var n = root
        while let cur = n {
            if p!.val < cur.val && q!.val < cur.val { n = cur.left }
            else if p!.val > cur.val && q!.val > cur.val { n = cur.right }
            else { return cur }
        }
        return nil
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
let r = fromLevel([6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5])!
checkInt(sol.lowestCommonAncestor(r, find(r, 2), find(r, 8))!.val, 6, "2,8")
checkInt(sol.lowestCommonAncestor(r, find(r, 2), find(r, 4))!.val, 2, "2,4")
checkInt(sol.lowestCommonAncestor(r, find(r, 3), find(r, 5))!.val, 4, "3,5")
checkInt(sol.lowestCommonAncestor(r, find(r, 0), find(r, 9))!.val, 6, "0,9")
let r2 = fromLevel([2, 1])!
checkInt(sol.lowestCommonAncestor(r2, find(r2, 2), find(r2, 1))!.val, 2, "parent")
print("All tests passed!")
