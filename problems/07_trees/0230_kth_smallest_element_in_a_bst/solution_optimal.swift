// Problem: 0230. Kth Smallest Element in a BST
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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack: [TreeNode] = []
        var cur = root
        var k = k
        while true {
            while let c = cur { stack.append(c); cur = c.left }
            let n = stack.removeLast()
            k -= 1
            if k == 0 { return n.val }
            cur = n.right
        }
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.kthSmallest(fromLevel([3, 1, 4, nil, 2]), 1), 1, "k1")
checkInt(sol.kthSmallest(fromLevel([3, 1, 4, nil, 2]), 2), 2, "k2")
checkInt(sol.kthSmallest(fromLevel([3, 1, 4, nil, 2]), 3), 3, "k3")
checkInt(sol.kthSmallest(fromLevel([5, 3, 6, 2, 4, nil, nil, 1]), 3), 3, "big")
checkInt(sol.kthSmallest(fromLevel([1]), 1), 1, "one")
print("All tests passed!")
