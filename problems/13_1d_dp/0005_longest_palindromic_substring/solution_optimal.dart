// 0005. Longest Palindromic Substring
String longestPalindrome(String s) {
  if (s.isEmpty) return "";
  var bl = 0, br = 0;
  void expand(int l, int r) {
    while (l >= 0 && r < s.length && s[l] == s[r]) { l--; r++; }
    l++; r--;
    if (r - l > br - bl) { bl = l; br = r; }
  }
  for (var i = 0; i < s.length; i++) { expand(i, i); expand(i, i + 1); }
  return s.substring(bl, br + 1);
}
void main() {
  final r1 = longestPalindrome("babad");
  if (r1 != "bab" && r1 != "aba") throw 'a';
  if (longestPalindrome("cbbd") != "bb") throw 'b';
  if (longestPalindrome("a") != "a") throw 'c';
  if (longestPalindrome("") != "") throw 'd';
  final r5 = longestPalindrome("ac");
  if (r5 != "a" && r5 != "c") throw 'e';
  if (longestPalindrome("racecar") != "racecar") throw 'f';
  print('All tests passed!');
}
