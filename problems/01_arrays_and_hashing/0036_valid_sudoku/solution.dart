// Problem: 36. Valid Sudoku
// Difficulty: Medium
// URL: https://leetcode.com/problems/valid-sudoku/
//
// 【解法演進】三趟檢查 → 一遍走訪 + 三組集合（最佳）
// 【最佳解核心思路】rows/cols/boxes 三組集合一起更新，b = (i~/3)*3 + (j~/3)。
// 【複雜度】時間：O(1)  空間：O(1)

bool isValidSudoku(List<List<String>> board) {
  final rows = List.generate(9, (_) => <String>{});
  final cols = List.generate(9, (_) => <String>{});
  final boxes = List.generate(9, (_) => <String>{});
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      final c = board[i][j];
      if (c == '.') continue;
      final b = (i ~/ 3) * 3 + (j ~/ 3);
      if (rows[i].contains(c) || cols[j].contains(c) || boxes[b].contains(c)) return false;
      rows[i].add(c);
      cols[j].add(c);
      boxes[b].add(c);
    }
  }
  return true;
}

void _expect(bool actual, bool expected, String name) {
  if (actual == expected) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $expected but got $actual');
  }
}

void main() {
  final valid = <List<String>>[
    ['5', '3', '.', '.', '7', '.', '.', '.', '.'],
    ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
    ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
    ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
    ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
    ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
    ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
    ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
    ['.', '.', '.', '.', '8', '.', '.', '7', '9'],
  ];
  final invalid = valid.map((r) => [...r]).toList();
  invalid[0][0] = '8';

  final empty = List.generate(9, (_) => List<String>.filled(9, '.'));

  _expect(isValidSudoku(valid), true, 'Test 1: valid');
  _expect(isValidSudoku(invalid), false, 'Test 2: column conflict');
  _expect(isValidSudoku(empty), true, 'Test 3: empty');

  final box = empty.map((r) => [...r]).toList();
  box[0][0] = '5';
  box[1][1] = '5';
  _expect(isValidSudoku(box), false, 'Test 4: box conflict');

  final row = empty.map((r) => [...r]).toList();
  row[0][0] = '5';
  row[0][8] = '5';
  _expect(isValidSudoku(row), false, 'Test 5: row conflict');

  print('All tests passed!');
}
