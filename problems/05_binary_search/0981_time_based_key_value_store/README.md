# 0981. Time Based Key-Value Store

- 難度：Medium
- LeetCode：https://leetcode.com/problems/time-based-key-value-store/

## 題目描述（中文）

設計類別 `TimeMap`，支援：
- `set(key, value, timestamp)`：將 `(value, timestamp)` 記錄於 `key`。
- `get(key, timestamp)`：回傳該 key 在 ≤ `timestamp` 的最大 `prev_timestamp` 對應值；若不存在則回傳 `""`。

保證 `set` 呼叫的 `timestamp` 嚴格遞增。

## 範例 / 限制

```
set("foo","bar",1)
get("foo",1)   // "bar"
get("foo",3)   // "bar"
set("foo","bar2",4)
get("foo",4)   // "bar2"
get("foo",5)   // "bar2"
```

## 解法

### 解法 1：HashMap + 每個 key 一個 (timestamp, value) 升序陣列 + 二分（最佳解）

由於 `set` 的 timestamp 嚴格遞增，每個 key 的陣列天然遞增。
- `set`：O(1) 直接 append。
- `get`：對該陣列二分，找最大的 `t' <= timestamp` 對應的 value。

二分版本（找 `<= target` 的最右位置）：
```
l, r = 0, n - 1
ans = ""
while l <= r:
    mid = (l + r) // 2
    if arr[mid][0] <= timestamp:
        ans = arr[mid][1]   # 候選
        l = mid + 1         # 嘗試更大
    else:
        r = mid - 1
```

- 時間：`set` O(1)，`get` O(log n)
- 空間：O(總 set 次數)

### 解法 2：暴力線性

`get` 時線性掃描所有記錄。`get` O(n)，會 TLE。

## 範例追蹤（解法 1）

```
set("foo","bar",1)  -> map["foo"]=[(1,"bar")]
get("foo",3)        -> 二分 [(1,"bar")]，1<=3 -> ans="bar"
set("foo","bar2",4) -> map["foo"]=[(1,"bar"),(4,"bar2")]
get("foo",4)        -> 4<=4 -> ans="bar2"
```

## 關鍵點 / 易錯陷阱

- 二分模板：「找最後一個滿足條件的元素」。先暫存候選 `ans`，命中時繼續往右找。
- 找不到（所有 timestamp 都 > 查詢值）回傳 `""`。
- 用 `bisect_right(arr, (timestamp, "~"))` + 取前一個亦可（注意元組比較規則）。為清晰起見，自寫二分最穩。
