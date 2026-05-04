// Problem: 0355. Design Twitter
// Difficulty: Medium

import Foundation

struct TwEntry {
    let t: Int; let tid: Int; let u: Int; let idx: Int
}

struct TwHeap {
    var a: [TwEntry] = []
    var count: Int { a.count }
    mutating func push(_ e: TwEntry) {
        // TODO: implement
    }
    @discardableResult
    mutating func pop() -> TwEntry {
        // TODO: implement
        return nil
    }
}

class Twitter {
    var time = 0
    var tweets: [Int: [(Int, Int)]] = [:]
    var follows: [Int: Set<Int>] = [:]
    init() {
        // TODO: implement
    }

    func postTweet(_ userId: Int, _ tweetId: Int) {
        // TODO: implement
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        // TODO: implement
        return []
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        // TODO: implement
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        // TODO: implement
    }
}

func checkArr(_ a: [Int], _ e: [Int], _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
