// Problem: 0572. Subtree of Another Tree
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
    func isSubtree(_ root: TreeNode?, _ sub: TreeNode?) -> Bool {
        if sub == nil { return true }
        if root == nil { return false }
        if same(root, sub) { return true }
        return isSubtree(root!.left, sub) || isSubtree(root!.right, sub)
    }
    private func same(_ a: TreeNode?, _ b: TreeNode?) -> Bool {
        if a == nil && b == nil { return true }
        if a == nil || b == nil { return false }
        return a!.val == b!.val && same(a!.left, b!.left) && same(a!.right, b!.right)
    }
}

func checkBool(_ a: Bool, _ e: Bool, _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkBool(sol.isSubtree(fromLevel([3, 4, 5, 1, 2]), fromLevel([4, 1, 2])), true, "ex1")
checkBool(sol.isSubtree(fromLevel([3, 4, 5, 1, 2, nil, nil, nil, nil, 0]), fromLevel([4, 1, 2])), false, "ex2")
checkBool(sol.isSubtree(fromLevel([1, 1]), fromLevel([1])), true, "small")
checkBool(sol.isSubtree(fromLevel([]), fromLevel([1])), false, "empty root")
checkBool(sol.isSubtree(fromLevel([1, 2, 3]), fromLevel([])), true, "empty sub")
print("All tests passed!")
