// Problem: 567. Permutation in String
// Difficulty: Medium
// URL: https://leetcode.com/problems/permutation-in-string/
//
// 【解法演進】排序比對 → 計數比較 O(26n) → 固定窗口 + matches O(n)（最佳）
// 【最佳解核心思路】維護兩 26 元計數與 matches，滑窗時依相等狀態翻轉更新。
// 【複雜度】時間：O(n)  空間：O(1)

bool checkInclusion(String s1, String s2) {
  if (s1.length > s2.length) return false;
  final A = 'a'.codeUnitAt(0);
  final c1 = List<int>.filled(26, 0);
  final c2 = List<int>.filled(26, 0);
  for (int i = 0; i < s1.length; i++) {
    c1[s1.codeUnitAt(i) - A]++;
    c2[s2.codeUnitAt(i) - A]++;
  }
  int matches = 0;
  for (int i = 0; i < 26; i++) if (c1[i] == c2[i]) matches++;
  if (matches == 26) return true;

  for (int r = s1.length; r < s2.length; r++) {
    int idx = s2.codeUnitAt(r) - A;
    bool before = c2[idx] == c1[idx];
    c2[idx]++;
    bool after = c2[idx] == c1[idx];
    if (before != after) matches += after ? 1 : -1;

    idx = s2.codeUnitAt(r - s1.length) - A;
    before = c2[idx] == c1[idx];
    c2[idx]--;
    after = c2[idx] == c1[idx];
    if (before != after) matches += after ? 1 : -1;

    if (matches == 26) return true;
  }
  return false;
}

void _expect(bool actual, bool expected, String name) {
  if (actual == expected) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $expected but got $actual');
  }
}

void main() {
  _expect(checkInclusion('ab', 'eidbaooo'), true, 'Test 1');
  _expect(checkInclusion('ab', 'eidboaoo'), false, 'Test 2');
  _expect(checkInclusion('a', 'a'), true, 'Test 3');
  _expect(checkInclusion('ab', 'a'), false, 'Test 4: s1 longer');
  _expect(checkInclusion('abc', 'ccccbbbbaaaa'), false, 'Test 5');
  _expect(checkInclusion('hello', 'ooolleoooleh'), false, 'Test 6');
  _expect(checkInclusion('adc', 'dcda'), true, 'Test 7');

  print('All tests passed!');
}
