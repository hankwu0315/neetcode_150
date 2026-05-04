// Problem: 0146. LRU Cache
// Difficulty: Medium

import Foundation

class LRUNode {
    var key: Int; var val: Int
    var prev: LRUNode?; var next: LRUNode?
    init(_ k: Int = 0, _ v: Int = 0) { key = k; val = v }
}

class LRUCache {
    let cap: Int
    var map: [Int: LRUNode] = [:]
    let head = LRUNode()
    let tail = LRUNode()

    init(_ capacity: Int) {
        cap = capacity
        head.next = tail
        tail.prev = head
    }

    private func remove(_ n: LRUNode) {
        n.prev!.next = n.next
        n.next!.prev = n.prev
    }

    private func addFront(_ n: LRUNode) {
        n.prev = head
        n.next = head.next
        head.next!.prev = n
        head.next = n
    }

    func get(_ key: Int) -> Int {
        guard let n = map[key] else { return -1 }
        remove(n); addFront(n)
        return n.val
    }

    func put(_ key: Int, _ value: Int) {
        if let n = map[key] {
            n.val = value
            remove(n); addFront(n)
            return
        }
        let n = LRUNode(key, value)
        map[key] = n
        addFront(n)
        if map.count > cap {
            let lru = tail.prev!
            remove(lru)
            map.removeValue(forKey: lru.key)
        }
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let c = LRUCache(2)
c.put(1, 1); c.put(2, 2)
checkInt(c.get(1), 1, "g1")
c.put(3, 3); checkInt(c.get(2), -1, "evict 2")
c.put(4, 4); checkInt(c.get(1), -1, "evict 1")
checkInt(c.get(3), 3, "g3")
checkInt(c.get(4), 4, "g4")

let c2 = LRUCache(2)
c2.put(1, 1); c2.put(2, 2)
c2.put(1, 10); checkInt(c2.get(1), 10, "update")
c2.put(3, 3); checkInt(c2.get(2), -1, "evict old")
checkInt(c2.get(1), 10, "still 1")
print("All tests passed!")
