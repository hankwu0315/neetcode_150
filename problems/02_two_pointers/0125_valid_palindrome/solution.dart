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
  // TODO: implement
  return false;
}

bool isPalindromeBrute(String s) {
  // TODO: implement
  return false;
}


void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
