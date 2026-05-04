# 0039. Combination Sum

- 難度：Medium
- LeetCode：https://leetcode.com/problems/combination-sum/

## 題目描述（中文）

給互異正整數 `candidates` 與正整數 `target`，求所有「**元素可重複使用**」、和為 `target` 的不同組合（順序不計）。

## 範例 / 限制

- `[2,3,6,7], target=7` → `[[2,2,3],[7]]`
- `[2,3,5], target=8` → `[[2,2,2,2],[2,3,3],[3,5]]`
- 1 ≤ candidates.length ≤ 30，1 ≤ target ≤ 40。

## 解法

### 解法（回溯）：每位置決定加入或下一個

排序後 dfs(i, remain, path)：
- 若 `remain == 0`：收答案。
- 由 `i` 起遍歷，若 `c[j] > remain` 提早結束。
- 「重複使用」：選 j 後仍以 `j` 為起點繼續。

時間 O( ~指數 )，空間 O(target)。

## 範例追蹤

`[2,3,6,7], target=7`：dfs(0,7) → 取 2*3+? → 2,2,2 over → 2,2,3 ✓ → 取 7 ✓。

## 關鍵點 / 易錯陷阱

- 同位置可重複，但下一層仍要從 `j`（不是 `j+1`）避免相同組合不同順序重複。
- 排序後可剪枝。
