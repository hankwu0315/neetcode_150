// Problem: 271. Encode and Decode Strings (Premium)
// Difficulty: Medium
// URL: https://leetcode.com/problems/encode-and-decode-strings/
//
// 【解法演進】脆弱分隔符（壞）→ 長度前綴 + '#'（最佳）
// 【最佳解核心思路】encode 每個字串前加 "len#"，decode 解析長度後切片。
// 【複雜度】時間：O(N)  空間：O(N)

class Codec {
  String encode(List<String> strs) {
    final buf = StringBuffer();
    for (final s in strs) {
      buf.write(s.length);
      buf.write('#');
      buf.write(s);
    }
    return buf.toString();
  }

  List<String> decode(String s) {
    final result = <String>[];
    int i = 0;
    while (i < s.length) {
      final j = s.indexOf('#', i);
      final length = int.parse(s.substring(i, j));
      result.add(s.substring(j + 1, j + 1 + length));
      i = j + 1 + length;
    }
    return result;
  }
}

void _expect(List<String> actual, List<String> expected, String name) {
  if (actual.toString() == expected.toString()) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $expected but got $actual');
  }
}

void main() {
  final codec = Codec();
  final cases = <List<String>>[
    ['lint', 'code', 'love', 'you'],
    ['we', 'say', ':', 'yes'],
    [''],
    [],
    ['', ''],
    ['#', '1#', 'abc#def', '##'],
    ['a' * 100, 'b' * 50],
  ];
  for (int i = 0; i < cases.length; i++) {
    final c = cases[i];
    final decoded = codec.decode(codec.encode(c));
    _expect(decoded, c, 'Test ${i + 1}');
  }

  print('All tests passed!');
}
