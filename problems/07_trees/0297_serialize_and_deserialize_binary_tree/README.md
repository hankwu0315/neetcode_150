# 0297. Serialize and Deserialize Binary Tree

- 難度：Hard
- LeetCode：https://leetcode.com/problems/serialize-and-deserialize-binary-tree/

## 題目描述（中文）

設計演算法將二元樹序列化成字串，並能從該字串還原回相同樹。

## 範例 / 限制

- `[1,2,3,null,null,4,5]` 序列化後再反序列化應產出相同層序輸出。
- 空樹 `[]` 應可往返。

## 解法

### 解法（最佳解）：前序 DFS + null 標記

序列化：
```
def s(n):
    if n is None: out.append('#'); return
    out.append(str(n.val)); s(n.left); s(n.right)
```
反序列化用 iterator pop：
```
def d():
    v = next(it)
    if v == '#': return None
    n = TreeNode(int(v))
    n.left = d(); n.right = d()
    return n
```
- 時間：O(n) 兩端皆是
- 空間：O(n)

### 替代：BFS 層序

像 LeetCode 預設格式一樣 push `null`；反序列化用佇列從父節點為其安排左右。

## 關鍵點 / 易錯陷阱

- 一定要有 null 哨兵，否則無法重建結構。
- 若用空白分隔，注意值可能為負（不要錯切）。
