// Problem: 0981. Time Based Key-Value Store
// Difficulty: Medium

import Foundation

class TimeMap {
    private var store: [String: [(Int, String)]] = [:]

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        store[key, default: []].append((timestamp, value))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let arr = store[key], !arr.isEmpty else { return "" }
        var l = 0, r = arr.count - 1
        var ans = ""
        while l <= r {
            let mid = l + (r - l) / 2
            if arr[mid].0 <= timestamp {
                ans = arr[mid].1
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return ans
    }
}

func checkStr(_ a: String, _ e: String, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \"\(a)\" vs \"\(e)\"") }
}

let tm = TimeMap()
tm.set("foo", "bar", 1)
checkStr(tm.get("foo", 1), "bar", "g1")
checkStr(tm.get("foo", 3), "bar", "g3")
tm.set("foo", "bar2", 4)
checkStr(tm.get("foo", 4), "bar2", "g4")
checkStr(tm.get("foo", 5), "bar2", "g5")
checkStr(tm.get("foo", 0), "", "before")
checkStr(tm.get("missing", 10), "", "missing")

tm.set("a", "v1", 2)
tm.set("a", "v2", 5)
checkStr(tm.get("a", 4), "v1", "a4")
checkStr(tm.get("a", 5), "v2", "a5")
print("All tests passed!")
