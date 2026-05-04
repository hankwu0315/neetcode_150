// Problem: 0098. Validate Binary Search Tree
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

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        func valid(_ n: TreeNode?, _ lo: Int, _ hi: Int) -> Bool {
            guard let n = n else { return true }
            if !(n.val > lo && n.val < hi) { return false }
            return valid(n.left, lo, n.val) && valid(n.right, n.val, hi)
        }
        return valid(root, Int.min, Int.max)
    }
}

func checkBool(_ a: Bool, _ e: Bool, _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkBool(sol.isValidBST(fromLevel([2, 1, 3])), true, "ex1")
checkBool(sol.isValidBST(fromLevel([5, 1, 4, nil, nil, 3, 6])), false, "ex2")
checkBool(sol.isValidBST(fromLevel([])), true, "empty")
checkBool(sol.isValidBST(fromLevel([1])), true, "one")
checkBool(sol.isValidBST(fromLevel([5, 4, 6, nil, nil, 3, 7])), false, "right has 3")
checkBool(sol.isValidBST(fromLevel([10, 5, 15, nil, nil, 6, 20])), false, "ancestor")
print("All tests passed!")
