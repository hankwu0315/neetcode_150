// Problem: 1. Two Sum
// Difficulty: Easy
// URL: https://leetcode.com/problems/two-sum/
//
// 【解法演進】暴力 O(n²) → 一遍雜湊 O(n)（最佳）
// 【最佳解核心思路】先查 (target - x) 是否已見，沒有再寫入。
// 【複雜度】時間：O(n)  空間：O(n)

// 最佳解：一遍 HashMap
List<int> twoSum(List<int> nums, int target) {
  final seen = <int, int>{};
  for (int i = 0; i < nums.length; i++) {
    final comp = target - nums[i];
    if (seen.containsKey(comp)) return [seen[comp]!, i];
    seen[nums[i]] = i;
  }
  return [];
}

// 暴力解
List<int> twoSumBrute(List<int> nums, int target) {
  for (int i = 0; i < nums.length; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      if (nums[i] + nums[j] == target) return [i, j];
    }
  }
  return [];
}

List<int> _norm(List<int> p) => [...p]..sort();

void _expect(List<int> actual, List<int> expected, String name) {
  final a = _norm(actual);
  final b = _norm(expected);
  if (a.length == b.length && List.generate(a.length, (i) => a[i] == b[i]).every((x) => x)) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $b but got $a');
  }
}

void main() {
  _expect(twoSum([2, 7, 11, 15], 9), [0, 1], 'Test 1');
  _expect(twoSum([3, 2, 4], 6), [1, 2], 'Test 2');
  _expect(twoSum([3, 3], 6), [0, 1], 'Test 3: same value');
  _expect(twoSum([-1, -2, -3, -4, -5], -8), [2, 4], 'Test 4: negatives');
  _expect(twoSum([0, 4, 3, 0], 0), [0, 3], 'Test 5: zeros');

  _expect(twoSumBrute([2, 7, 11, 15], 9), [0, 1], 'Brute Test 1');
  _expect(twoSumBrute([3, 3], 6), [0, 1], 'Brute Test 2');

  print('All tests passed!');
}
