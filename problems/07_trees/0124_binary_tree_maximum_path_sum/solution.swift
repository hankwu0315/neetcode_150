// Problem: 0124. Binary Tree Maximum Path Sum
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

class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var ans = Int.min
        func gain(_ n: TreeNode?) -> Int {
            guard let n = n else { return 0 }
            let L = max(0, gain(n.left))
            let R = max(0, gain(n.right))
            ans = max(ans, n.val + L + R)
            return n.val + max(L, R)
        }
        _ = gain(root)
        return ans
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.maxPathSum(fromLevel([1, 2, 3])), 6, "ex1")
checkInt(sol.maxPathSum(fromLevel([-10, 9, 20, nil, nil, 15, 7])), 42, "ex2")
checkInt(sol.maxPathSum(fromLevel([-3])), -3, "one neg")
checkInt(sol.maxPathSum(fromLevel([2, -1])), 2, "pos+neg")
checkInt(sol.maxPathSum(fromLevel([-2, -1])), -1, "all neg")
checkInt(sol.maxPathSum(fromLevel([1, -2, -3, 1, 3, -2, nil, -1])), 3, "mixed")
print("All tests passed!")
