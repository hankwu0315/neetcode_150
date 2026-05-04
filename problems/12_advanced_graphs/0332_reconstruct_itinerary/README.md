# 0332. Reconstruct Itinerary

- 難度：Hard
- LeetCode：https://leetcode.com/problems/reconstruct-itinerary/

## 題目描述（中文）

機票 `tickets[i]=[from,to]`，從 `JFK` 出發走完所有票的歐拉路徑（路徑唯一不一定）。多解時取「字典序最小」。

## 範例 / 限制

- `[["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]` → `["JFK","MUC","LHR","SFO","SJC"]`

## 解法

### 解法（Hierholzer + 字典序）

對每個起點將鄰接表排序，從 `JFK` 開始 dfs：每次取當前鄰接表中字典序最小的目的地（pop），走完了把當前點加入結果。最後反轉。

時間 O(E log E)。

## 關鍵點 / 易錯陷阱

- 反向加入是因離開節點順序才是歐拉路徑。
- 用 sort + pop 從末端（注意字典序排好後 pop 末端會取「最大」，需排成相反序），這裡使用 sorted asc 後從前面 pop(0)（O(n)），或反向排序後 pop()。
