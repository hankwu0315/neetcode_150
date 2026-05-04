// Problem: 0017. Letter Combinations of a Phone Number
// Difficulty: Medium

List<String> letterCombinations(String digits) {
  if (digits.isEmpty) return <String>[];
  const m = {
    '2': 'abc', '3': 'def', '4': 'ghi', '5': 'jkl',
    '6': 'mno', '7': 'pqrs', '8': 'tuv', '9': 'wxyz',
  };
  final out = <String>[];
  final path = StringBuffer();
  final n = digits.length;
  void dfs(int i) {
    if (i == n) {
      out.add(path.toString());
      return;
    }
    final letters = m[digits[i]]!;
    for (var k = 0; k < letters.length; k++) {
      path.write(letters[k]);
      dfs(i + 1);
      final s = path.toString();
      path.clear();
      path.write(s.substring(0, s.length - 1));
    }
  }
  dfs(0);
  return out;
}

bool _eqList(List<String> a, List<String> b) {
  if (a.length != b.length) return false;
  final sa = List<String>.from(a)..sort();
  final sb = List<String>.from(b)..sort();
  for (var i = 0; i < sa.length; i++) if (sa[i] != sb[i]) return false;
  return true;
}

void main() {
  if (!_eqList(letterCombinations("23"),
      ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"])) throw 'a';
  if (letterCombinations("").isNotEmpty) throw 'b';
  if (!_eqList(letterCombinations("2"), ["a", "b", "c"])) throw 'c';
  if (!_eqList(letterCombinations("7"), ["p", "q", "r", "s"])) throw 'd';
  if (letterCombinations("234").length != 27) throw 'e';
  print('All tests passed!');
}
