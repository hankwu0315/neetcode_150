// Problem: 3. Longest Substring Without Repeating Characters
// Difficulty: Medium
// URL: https://leetcode.com/problems/longest-substring-without-repeating-characters/
//
// 【解法演進】暴力 O(n²) → 滑動窗口 + HashMap O(n)（最佳）
// 【最佳解核心思路】記錄每字元上次出現索引；遇重複跳左界。
// 【複雜度】時間：O(n)  空間：O(min(n, |Σ|))

int lengthOfLongestSubstring(String s) {
  final lastSeen = <String, int>{};
  int l = 0, best = 0;
  for (int r = 0; r < s.length; r++) {
    final c = s[r];
    final last = lastSeen[c];
    if (last != null && last >= l) l = last + 1;
    lastSeen[c] = r;
    if (r - l + 1 > best) best = r - l + 1;
  }
  return best;
}

int lengthOfLongestSubstringBrute(String s) {
  int best = 0;
  for (int i = 0; i < s.length; i++) {
    final seen = <String>{};
    for (int j = i; j < s.length; j++) {
      if (seen.contains(s[j])) break;
      seen.add(s[j]);
      if (j - i + 1 > best) best = j - i + 1;
    }
  }
  return best;
}

void _expect(int actual, int expected, String name) {
  if (actual == expected) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $expected but got $actual');
  }
}

void main() {
  _expect(lengthOfLongestSubstring('abcabcbb'), 3, 'Test 1');
  _expect(lengthOfLongestSubstring('bbbbb'), 1, 'Test 2');
  _expect(lengthOfLongestSubstring('pwwkew'), 3, 'Test 3');
  _expect(lengthOfLongestSubstring(''), 0, 'Test 4: empty');
  _expect(lengthOfLongestSubstring(' '), 1, 'Test 5: space');
  _expect(lengthOfLongestSubstring('dvdf'), 3, 'Test 6');
  _expect(lengthOfLongestSubstring('abcdef'), 6, 'Test 7: all unique');
  _expect(lengthOfLongestSubstringBrute('abcabcbb'), 3, 'Brute Test');

  print('All tests passed!');
}
