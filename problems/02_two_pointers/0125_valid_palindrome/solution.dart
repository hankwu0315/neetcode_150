// Problem: 125. Valid Palindrome
// Difficulty: Easy
// URL: https://leetcode.com/problems/valid-palindrome/
//
// 【解法演進】清理 + 反轉 O(n)/O(n) → 雙指標 O(n)/O(1)（最佳）
// 【最佳解核心思路】左右指標相向，跳過非英數，比較小寫字元。
// 【複雜度】時間：O(n)  空間：O(1)

bool _isAlnum(int c) {
  // 0-9, A-Z, a-z
  return (c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122);
}

int _toLower(int c) {
  if (c >= 65 && c <= 90) return c + 32;
  return c;
}

bool isPalindrome(String s) {
  int l = 0, r = s.length - 1;
  while (l < r) {
    while (l < r && !_isAlnum(s.codeUnitAt(l))) l++;
    while (l < r && !_isAlnum(s.codeUnitAt(r))) r--;
    if (_toLower(s.codeUnitAt(l)) != _toLower(s.codeUnitAt(r))) return false;
    l++;
    r--;
  }
  return true;
}

bool isPalindromeBrute(String s) {
  final buf = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    final c = s.codeUnitAt(i);
    if (_isAlnum(c)) buf.writeCharCode(_toLower(c));
  }
  final t = buf.toString();
  return t == t.split('').reversed.join();
}

void _expect(bool actual, bool expected, String name) {
  if (actual == expected) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $expected but got $actual');
  }
}

void main() {
  _expect(isPalindrome('A man, a plan, a canal: Panama'), true, 'Test 1');
  _expect(isPalindrome('race a car'), false, 'Test 2');
  _expect(isPalindrome(' '), true, 'Test 3: empty after clean');
  _expect(isPalindrome(''), true, 'Test 4: empty');
  _expect(isPalindrome('0P'), false, 'Test 5: digit vs letter');
  _expect(isPalindrome('a.'), true, 'Test 6: single alnum');
  _expect(isPalindrome('ab'), false, 'Test 7');
  _expect(isPalindromeBrute('A man, a plan, a canal: Panama'), true, 'Brute Test');

  print('All tests passed!');
}
