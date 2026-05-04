// Problem: 0141. Linked List Cycle
// Difficulty: Easy

import Foundation

class ListNode {
    var val: Int; var next: ListNode?
    init(_ v: Int = 0, _ n: ListNode? = nil) { val = v; next = n }
}

func buildWithCycle(_ a: [Int], _ pos: Int) -> ListNode? {
    if a.isEmpty { return nil }
    let nodes = a.map { ListNode($0) }
    for i in 0..<(nodes.count - 1) { nodes[i].next = nodes[i + 1] }
    if pos != -1 { nodes.last!.next = nodes[pos] }
    return nodes[0]
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head, fast = head
        while fast != nil && fast!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
            if slow === fast { return true }
        }
        return false
    }
}

func checkBool(_ a: Bool, _ e: Bool, _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkBool(sol.hasCycle(buildWithCycle([3, 2, 0, -4], 1)), true, "ex1")
checkBool(sol.hasCycle(buildWithCycle([1, 2], 0)), true, "ex2")
checkBool(sol.hasCycle(buildWithCycle([1], -1)), false, "one")
checkBool(sol.hasCycle(buildWithCycle([], -1)), false, "empty")
checkBool(sol.hasCycle(buildWithCycle([1, 2, 3], -1)), false, "no cycle")
print("All tests passed!")
