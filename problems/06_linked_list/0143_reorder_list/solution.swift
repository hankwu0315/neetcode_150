// Problem: 0143. Reorder List
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
    func reorderList(_ head: ListNode?) {
        guard let head = head, head.next != nil else { return }
        var slow = head, fast = head
        while fast.next != nil && fast.next!.next != nil {
            slow = slow.next!; fast = fast.next!.next!
        }
        var second = slow.next
        slow.next = nil
        var prev: ListNode? = nil
        while second != nil {
            let nxt = second!.next
            second!.next = prev
            prev = second
            second = nxt
        }
        var a: ListNode? = head, b = prev
        while b != nil {
            let aN = a!.next, bN = b!.next
            a!.next = b
            b!.next = aN
            a = aN; b = bN
        }
    }
}

func checkArr(_ a: [Int], _ e: [Int], _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
var h = fromArr([1, 2, 3, 4]); sol.reorderList(h); checkArr(toArr(h), [1, 4, 2, 3], "ex1")
h = fromArr([1, 2, 3, 4, 5]); sol.reorderList(h); checkArr(toArr(h), [1, 5, 2, 4, 3], "ex2")
h = fromArr([1]); sol.reorderList(h); checkArr(toArr(h), [1], "one")
h = fromArr([1, 2]); sol.reorderList(h); checkArr(toArr(h), [1, 2], "two")
h = fromArr([1, 2, 3]); sol.reorderList(h); checkArr(toArr(h), [1, 3, 2], "three")
print("All tests passed!")
