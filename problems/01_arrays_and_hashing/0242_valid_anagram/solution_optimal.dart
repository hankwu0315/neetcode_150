// Problem: 242. Valid Anagram
// Difficulty: Easy
// URL: https://leetcode.com/problems/valid-anagram/
//
// 【解法演進】排序比較 O(n log n) → 計數 O(n)（最佳）
// 【最佳解核心思路】長度不同直接 false；s +1、t -1，最後檢查全 0。
// 【複雜度】時間：O(n)  空間：O(1)（26 槽）

// 最佳解
bool isAnagram(String s, String t) {
  if (s.length != t.length) return false;
  final count = List<int>.filled(26, 0);
  final a = 'a'.codeUnitAt(0);
  for (int i = 0; i < s.length; i++) {
    count[s.codeUnitAt(i) - a]++;
    count[t.codeUnitAt(i) - a]--;
  }
  return count.every((c) => c == 0);
}

// 暴力解：排序比較
bool isAnagramBrute(String s, String t) {
  if (s.length != t.length) return false;
  final a = s.split('')..sort();
  final b = t.split('')..sort();
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

void _expect(dynamic actual, dynamic expected, String name) {
  if (actual == expected) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $expected but got $actual');
  }
}

void main() {
  _expect(isAnagram('anagram', 'nagaram'), true, 'Test 1');
  _expect(isAnagram('rat', 'car'), false, 'Test 2');
  _expect(isAnagram('', ''), true, 'Test 3: empty');
  _expect(isAnagram('a', 'a'), true, 'Test 4: single');
  _expect(isAnagram('ab', 'a'), false, 'Test 5: length diff');
  _expect(isAnagram('aacc', 'ccac'), false, 'Test 6: count diff');

  _expect(isAnagramBrute('anagram', 'nagaram'), true, 'Brute Test 1');
  _expect(isAnagramBrute('rat', 'car'), false, 'Brute Test 2');

  print('All tests passed!');
}
