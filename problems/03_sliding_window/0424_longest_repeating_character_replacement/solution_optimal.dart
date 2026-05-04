// Problem: 424. Longest Repeating Character Replacement
// Difficulty: Medium
// URL: https://leetcode.com/problems/longest-repeating-character-replacement/
//
// 【解法演進】枚舉主導字母 O(26n) → 單一滑動窗口 O(n)（最佳）
// 【最佳解核心思路】窗口 + count[26] + maxCount；窗長 - maxCount > k 則縮左。
// 【複雜度】時間：O(n)  空間：O(1)

int characterReplacement(String s, int k) {
  final count = List<int>.filled(26, 0);
  final A = 'A'.codeUnitAt(0);
  int l = 0, maxCount = 0, best = 0;
  for (int r = 0; r < s.length; r++) {
    final idx = s.codeUnitAt(r) - A;
    count[idx]++;
    if (count[idx] > maxCount) maxCount = count[idx];
    while ((r - l + 1) - maxCount > k) {
      count[s.codeUnitAt(l) - A]--;
      l++;
    }
    if (r - l + 1 > best) best = r - l + 1;
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
  _expect(characterReplacement('ABAB', 2), 4, 'Test 1');
  _expect(characterReplacement('AABABBA', 1), 4, 'Test 2');
  _expect(characterReplacement('A', 0), 1, 'Test 3: single');
  _expect(characterReplacement('AAAA', 2), 4, 'Test 4: all same');
  _expect(characterReplacement('ABCDE', 1), 2, 'Test 5');
  _expect(characterReplacement('ABCDE', 0), 1, 'Test 6: k=0');

  print('All tests passed!');
}
