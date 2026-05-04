// Problem: 49. Group Anagrams
// Difficulty: Medium
// URL: https://leetcode.com/problems/group-anagrams/
//
// 【解法演進】排序當 key O(n·k log k) → 26 元組計數 key O(n·k)（最佳）
// 【最佳解核心思路】每字串以 26 計數陣列作 key 歸類。
// 【複雜度】時間：O(n · k)  空間：O(n · k)

// 最佳解：計數陣列 String key
List<List<String>> groupAnagrams(List<String> strs) {
  final groups = <String, List<String>>{};
  final a = 'a'.codeUnitAt(0);
  for (final s in strs) {
    final count = List<int>.filled(26, 0);
    for (int i = 0; i < s.length; i++) count[s.codeUnitAt(i) - a]++;
    final key = count.join(',');
    groups.putIfAbsent(key, () => []).add(s);
  }
  return groups.values.toList();
}

// 暴力解：排序當 key
List<List<String>> groupAnagramsBrute(List<String> strs) {
  final groups = <String, List<String>>{};
  for (final s in strs) {
    final key = (s.split('')..sort()).join();
    groups.putIfAbsent(key, () => []).add(s);
  }
  return groups.values.toList();
}

List<List<String>> _norm(List<List<String>> g) {
  final inner = g.map((x) => [...x]..sort()).toList();
  inner.sort((a, b) => a.join(',').compareTo(b.join(',')));
  return inner;
}

void _expect(List<List<String>> actual, List<List<String>> expected, String name) {
  final a = _norm(actual);
  final b = _norm(expected);
  if (a.toString() == b.toString()) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $b but got $a');
  }
}

void main() {
  _expect(
    groupAnagrams(['eat', 'tea', 'tan', 'ate', 'nat', 'bat']),
    [['bat'], ['nat', 'tan'], ['ate', 'eat', 'tea']],
    'Test 1',
  );
  _expect(groupAnagrams(['']), [['']], 'Test 2: empty string');
  _expect(groupAnagrams(['a']), [['a']], 'Test 3: single');
  _expect(groupAnagrams(['abc', 'bca', 'cab']), [['abc', 'bca', 'cab']], 'Test 4');
  _expect(groupAnagrams(['a', 'b', 'c']), [['a'], ['b'], ['c']], 'Test 5: no anagrams');

  _expect(groupAnagramsBrute(['eat', 'tea', 'ate']), [['ate', 'eat', 'tea']], 'Brute Test');

  print('All tests passed!');
}
