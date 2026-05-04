// Problem: 0022. Generate Parentheses
// Difficulty: Medium

List<String> generateParenthesis(int n) {
  final out = <String>[];
  final path = StringBuffer();
  void dfs(int op, int cl) {
    if (op == n && cl == n) {
      out.add(path.toString());
      return;
    }
    if (op < n) {
      path.write('(');
      dfs(op + 1, cl);
      final s = path.toString();
      path.clear(); path.write(s.substring(0, s.length - 1));
    }
    if (cl < op) {
      path.write(')');
      dfs(op, cl + 1);
      final s = path.toString();
      path.clear(); path.write(s.substring(0, s.length - 1));
    }
  }
  dfs(0, 0);
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
  if (!_eqList(generateParenthesis(3),
      ["((()))", "(()())", "(())()", "()(())", "()()()"])) throw 'a';
  if (!_eqList(generateParenthesis(1), ["()"])) throw 'b';
  if (!_eqList(generateParenthesis(2), ["(())", "()()"])) throw 'c';
  if (generateParenthesis(4).length != 14) throw 'd';
  if (generateParenthesis(5).length != 42) throw 'e';
  print('All tests passed!');
}
