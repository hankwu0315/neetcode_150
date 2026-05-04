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
        a.append(e)
        var i = a.count - 1
        while i > 0 {
            let p = (i - 1) >> 1
            if a[p].t >= a[i].t { break }
            a.swapAt(p, i); i = p
        }
    }
    @discardableResult
    mutating func pop() -> TwEntry {
        let t0 = a[0]
        let last = a.removeLast()
        if !a.isEmpty {
            a[0] = last
            var i = 0; let n = a.count
            while true {
                let l = 2 * i + 1, r = 2 * i + 2
                var m = i
                if l < n && a[l].t > a[m].t { m = l }
                if r < n && a[r].t > a[m].t { m = r }
                if m == i { break }
                a.swapAt(i, m); i = m
            }
        }
        return t0
    }
}

class Twitter {
    var time = 0
    var tweets: [Int: [(Int, Int)]] = [:]
    var follows: [Int: Set<Int>] = [:]
    init() {}

    func postTweet(_ userId: Int, _ tweetId: Int) {
        tweets[userId, default: []].append((time, tweetId))
        time += 1
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        var fs = follows[userId] ?? Set<Int>()
        fs.insert(userId)
        var h = TwHeap()
        for u in fs {
            if let lst = tweets[u], !lst.isEmpty {
                let idx = lst.count - 1
                h.push(TwEntry(t: lst[idx].0, tid: lst[idx].1, u: u, idx: idx))
            }
        }
        var out: [Int] = []
        while h.count > 0 && out.count < 10 {
            let e = h.pop()
            out.append(e.tid)
            if e.idx > 0 {
                let lst = tweets[e.u]!
                h.push(TwEntry(t: lst[e.idx - 1].0, tid: lst[e.idx - 1].1, u: e.u, idx: e.idx - 1))
            }
        }
        return out
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        if followerId == followeeId { return }
        follows[followerId, default: []].insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        follows[followerId]?.remove(followeeId)
    }
}

func checkArr(_ a: [Int], _ e: [Int], _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let tw = Twitter()
tw.postTweet(1, 5)
checkArr(tw.getNewsFeed(1), [5], "a")
tw.follow(1, 2)
tw.postTweet(2, 6)
checkArr(tw.getNewsFeed(1), [6, 5], "b")
tw.unfollow(1, 2)
checkArr(tw.getNewsFeed(1), [5], "c")
let tw2 = Twitter()
for i in 0..<11 { tw2.postTweet(1, i) }
checkArr(tw2.getNewsFeed(1), [10, 9, 8, 7, 6, 5, 4, 3, 2, 1], "d")
print("All tests passed!")
