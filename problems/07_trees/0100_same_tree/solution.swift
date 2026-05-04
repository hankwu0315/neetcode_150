// Problem: 0100. Same Tree
// Difficulty: Easy

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

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if p == nil || q == nil { return false }
        return p!.val == q!.val && isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
    }
}

func checkBool(_ a: Bool, _ e: Bool, _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkBool(sol.isSameTree(fromLevel([1, 2, 3]), fromLevel([1, 2, 3])), true, "ex1")
checkBool(sol.isSameTree(fromLevel([1, 2]), fromLevel([1, nil, 2])), false, "ex2")
checkBool(sol.isSameTree(fromLevel([1, 2, 1]), fromLevel([1, 1, 2])), false, "ex3")
checkBool(sol.isSameTree(fromLevel([]), fromLevel([])), true, "empty")
checkBool(sol.isSameTree(fromLevel([1]), fromLevel([])), false, "one vs empty")
print("All tests passed!")
