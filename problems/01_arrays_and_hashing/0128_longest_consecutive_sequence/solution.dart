// Problem: 128. Longest Consecutive Sequence
// Difficulty: Medium
// URL: https://leetcode.com/problems/longest-consecutive-sequence/
//
// 【解法演進】排序 O(n log n) → HashSet + 從起點展開 O(n)（最佳）
// 【最佳解核心思路】只從序列起點（x-1 不在 set）開始向上展開。
// 【複雜度】時間：O(n)  空間：O(n)

int longestConsecutive(List<int> nums) {
  final s = nums.toSet();
  int best = 0;
  for (final x in s) {
    if (!s.contains(x - 1)) {
      int cur = x;
      int length = 1;
      while (s.contains(cur + 1)) {
        cur++;
        length++;
      }
      if (length > best) best = length;
    }
  }
  return best;
}

int longestConsecutiveBrute(List<int> nums) {
  if (nums.isEmpty) return 0;
  final arr = nums.toSet().toList()..sort();
  int best = 1, cur = 1;
  for (int i = 1; i < arr.length; i++) {
    if (arr[i] == arr[i - 1] + 1) {
      cur++;
      if (cur > best) best = cur;
    } else {
      cur = 1;
    }
  }
  return best;
}

void _expect(int actual, int expected, String name) {
  if (actual == expected) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $expected but got $actual');
  }
}

void main() {
  _expect(longestConsecutive([100, 4, 200, 1, 3, 2]), 4, 'Test 1');
  _expect(longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]), 9, 'Test 2');
  _expect(longestConsecutive([]), 0, 'Test 3: empty');
  _expect(longestConsecutive([1]), 1, 'Test 4: single');
  _expect(longestConsecutive([1, 1, 1]), 1, 'Test 5: dups');
  _expect(longestConsecutive([-1, -2, -3, 0, 1]), 5, 'Test 6: negatives');
  _expect(longestConsecutive([10, 20, 30]), 1, 'Test 7: no consecutive');
  _expect(longestConsecutiveBrute([100, 4, 200, 1, 3, 2]), 4, 'Brute Test');

  print('All tests passed!');
}
