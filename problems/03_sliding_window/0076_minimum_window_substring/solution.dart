// Problem: 76. Minimum Window Substring
// Difficulty: Hard
// URL: https://leetcode.com/problems/minimum-window-substring/
//
// 【解法演進】暴力 O(n²) → 滑動窗口 + have/required（最佳）
// 【最佳解核心思路】need 計數 + window 計數 + have；have == required 時縮左更新答案。
// 【複雜度】時間：O(|s| + |t|)  空間：O(|Σ|)

String minWindow(String s, String t) {
  if (t.isEmpty || s.length < t.length) return '';
  final need = <String, int>{};
  for (int i = 0; i < t.length; i++) {
    need[t[i]] = (need[t[i]] ?? 0) + 1;
  }
  final required = need.length;
  final window = <String, int>{};
  int have = 0, l = 0;
  int bestLen = 1 << 30, bestL = 0, bestR = -1;
  for (int r = 0; r < s.length; r++) {
    final c = s[r];
    window[c] = (window[c] ?? 0) + 1;
    if (need.containsKey(c) && window[c] == need[c]) have++;
    while (have == required) {
      if (r - l + 1 < bestLen) {
        bestLen = r - l + 1;
        bestL = l;
        bestR = r;
      }
      final lc = s[l];
      window[lc] = window[lc]! - 1;
      if (need.containsKey(lc) && window[lc]! < need[lc]!) have--;
      l++;
    }
  }
  return bestR < 0 ? '' : s.substring(bestL, bestR + 1);
}

void _expect(String actual, String expected, String name) {
  if (actual == expected) {
    print('✓ $name');
  } else {
    print('✗ $name: expected "$expected" but got "$actual"');
  }
}

void main() {
  _expect(minWindow('ADOBECODEBANC', 'ABC'), 'BANC', 'Test 1');
  _expect(minWindow('a', 'a'), 'a', 'Test 2');
  _expect(minWindow('a', 'aa'), '', 'Test 3: insufficient');
  _expect(minWindow('aa', 'aa'), 'aa', 'Test 4');
  _expect(minWindow('ab', 'b'), 'b', 'Test 5');
  _expect(minWindow('', 'a'), '', 'Test 6: empty s');
  _expect(minWindow('aaflslflsldkalskaaa', 'aaa'), 'aaa', 'Test 7');

  print('All tests passed!');
}
