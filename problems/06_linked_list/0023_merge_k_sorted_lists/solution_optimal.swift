// Problem: 0023. Merge K Sorted Lists
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
    private func merge2(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
        let d = ListNode(); var t = d
        var a = a, b = b
        while a != nil && b != nil {
            if a!.val <= b!.val { t.next = a; a = a!.next }
            else                { t.next = b; b = b!.next }
            t = t.next!
        }
        t.next = a ?? b
        return d.next
    }

    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }
        var ls = lists
        var step = 1
        let n = ls.count
        while step < n {
            var i = 0
            while i + step < n {
                ls[i] = merge2(ls[i], ls[i + step])
                i += step * 2
            }
            step *= 2
        }
        return ls[0]
    }
}

func checkArr(_ a: [Int], _ e: [Int], _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkArr(toArr(sol.mergeKLists([fromArr([1, 4, 5]), fromArr([1, 3, 4]), fromArr([2, 6])])),
    [1, 1, 2, 3, 4, 4, 5, 6], "ex1")
checkArr(toArr(sol.mergeKLists([])), [], "empty")
checkArr(toArr(sol.mergeKLists([fromArr([])])), [], "one empty")
checkArr(toArr(sol.mergeKLists([fromArr([]), fromArr([1])])), [1], "mixed")
checkArr(toArr(sol.mergeKLists([fromArr([1]), fromArr([0])])), [0, 1], "two")
print("All tests passed!")
