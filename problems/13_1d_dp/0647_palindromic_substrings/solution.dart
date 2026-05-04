// 0647. Palindromic Substrings
int countSubstrings(String s) {
  var cnt = 0;
  int expand(int l, int r) {
    var c = 0;
    while (l >= 0 && r < s.length && s[l] == s[r]) { c++; l--; r++; }
    return c;
  }
  for (var i = 0; i < s.length; i++) { cnt += expand(i, i); cnt += expand(i, i + 1); }
  return cnt;
}
void main() {
  if (countSubstrings("abc") != 3) throw 'a';
  if (countSubstrings("aaa") != 6) throw 'b';
  if (countSubstrings("") != 0) throw 'c';
  if (countSubstrings("a") != 1) throw 'd';
  if (countSubstrings("aaaa") != 10) throw 'e';
  if (countSubstrings("abba") != 6) throw 'f';
  print('All tests passed!');
}
