// 0678. Valid Parenthesis String
bool checkValidString(String s) {
  var lo = 0, hi = 0;
  for (var i = 0; i < s.length; i++) {
    final c = s[i];
    if (c == '(') { lo++; hi++; }
    else if (c == ')') { lo--; hi--; }
    else { lo--; hi++; }
    if (hi < 0) return false;
    if (lo < 0) lo = 0;
  }
  return lo == 0;
}
void main() {
  if (checkValidString("()") != true) throw 'a';
  if (checkValidString("(*)") != true) throw 'b';
  if (checkValidString("(*))") != true) throw 'c';
  if (checkValidString("") != true) throw 'd';
  if (checkValidString(")(") != false) throw 'e';
  if (checkValidString("(((((*)))**") != true) throw 'f';
  if (checkValidString("(()") != false) throw 'g';
  print('All tests passed!');
}
