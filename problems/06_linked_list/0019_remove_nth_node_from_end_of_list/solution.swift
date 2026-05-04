// Problem: 0019. Remove Nth Node From End of List
// Difficulty: Medium

import Foundation

class ListNode {
    var val: Int; var next: ListNode?
    init(_ v: Int = 0, _ n: ListNode? = nil) { val = v; next = n }
}

func fromArr(_ a: [Int]) -> ListNode? {
    let d = ListNode(); var c = d
    for v in a { c.next = ListNode(v); c = c.next! }
    return d.next
}

func toArr(_ h: ListNode?) -> [Int] {
    var out: [Int] = []; var p = h
    while p != nil { out.append(p!.val); p = p!.next }
    return out
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var fast: ListNode? = dummy, slow: ListNode? = dummy
        for _ in 0..<(n + 1) { fast = fast!.next }
        while fast != nil { fast = fast!.next; slow = slow!.next }
        slow!.next = slow!.next!.next
        return dummy.next
    }
}

func checkArr(_ a: [Int], _ e: [Int], _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkArr(toArr(sol.removeNthFromEnd(fromArr([1, 2, 3, 4, 5]), 2)), [1, 2, 3, 5], "ex1")
checkArr(toArr(sol.removeNthFromEnd(fromArr([1]), 1)), [], "one")
checkArr(toArr(sol.removeNthFromEnd(fromArr([1, 2]), 1)), [1], "tail")
checkArr(toArr(sol.removeNthFromEnd(fromArr([1, 2]), 2)), [2], "head")
checkArr(toArr(sol.removeNthFromEnd(fromArr([1, 2, 3, 4, 5]), 5)), [2, 3, 4, 5], "head5")
checkArr(toArr(sol.removeNthFromEnd(fromArr([1, 2, 3, 4, 5]), 1)), [1, 2, 3, 4], "tail5")
print("All tests passed!")
