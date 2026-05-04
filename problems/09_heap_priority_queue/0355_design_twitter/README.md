# 0355. Design Twitter

- 難度：Medium
- LeetCode：https://leetcode.com/problems/design-twitter/

## 題目描述（中文）

實作簡化 Twitter：
- `postTweet(userId, tweetId)`
- `getNewsFeed(userId)`：取得自己與所追蹤者最新 10 則 tweet（時序最新優先）
- `follow(followerId, followeeId)`
- `unfollow(followerId, followeeId)`

## 範例 / 限制

- `postTweet(1,5); getNewsFeed(1)` → `[5]`
- `follow(1,2); postTweet(2,6); getNewsFeed(1)` → `[6,5]`
- `unfollow(1,2); getNewsFeed(1)` → `[5]`

## 解法

### 解法（最佳解）：HashMap + 每用戶 tweet 串列 + Heap 合併

- 每位 user 一個 list of (time, tweetId)（往後 push）。
- 自己也算追蹤對象（簡化）。
- `getNewsFeed`：對每位被追蹤者取最後一則放入 max-heap（依 time 排序），pop 一個就 push 該用戶下一則。最多取 10 個。

複雜度（U=被追蹤數）：
- post O(1)
- feed O((U + 10) log U)

## 關鍵點 / 易錯陷阱

- 一個全域時間戳 `time` 即可作排序鍵。
- 注意 `follow` 自己無效：用 set 去重；`getNewsFeed` 時把 self 一併納入。
- 若 followee 從未發推，跳過。
