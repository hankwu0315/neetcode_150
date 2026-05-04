// Problem: 0025. Reverse Nodes in k-Group
// Difficulty: Hard

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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var groupPrev: ListNode? = dummy
        while true {
            var kth: ListNode? = groupPrev
            for _ in 0..<k {
                kth = kth?.next
                if kth == nil { return dummy.next }
            }
            let groupNext = kth!.next
            var prev: ListNode? = groupNext
            var cur: ListNode? = groupPrev!.next
            while cur !== groupNext {
                let nxt = cur!.next
                cur!.next = prev
                prev = cur
                cur = nxt
            }
            let tmp = groupPrev!.next
            groupPrev!.next = kth
            groupPrev = tmp
        }
    }
}

func checkArr(_ a: [Int], _ e: [Int], _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkArr(toArr(sol.reverseKGroup(fromArr([1, 2, 3, 4, 5]), 2)), [2, 1, 4, 3, 5], "k2")
checkArr(toArr(sol.reverseKGroup(fromArr([1, 2, 3, 4, 5]), 3)), [3, 2, 1, 4, 5], "k3")
checkArr(toArr(sol.reverseKGroup(fromArr([1, 2, 3, 4, 5, 6]), 3)), [3, 2, 1, 6, 5, 4], "full2")
checkArr(toArr(sol.reverseKGroup(fromArr([1, 2, 3, 4, 5]), 1)), [1, 2, 3, 4, 5], "k1")
checkArr(toArr(sol.reverseKGroup(fromArr([1, 2]), 5)), [1, 2], "too short")
checkArr(toArr(sol.reverseKGroup(fromArr([]), 2)), [], "empty")
print("All tests passed!")
