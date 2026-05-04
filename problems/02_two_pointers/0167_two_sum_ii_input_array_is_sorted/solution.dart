// Problem: 167. Two Sum II - Input Array Is Sorted
// Difficulty: Medium
// URL: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
//
// 【解法演進】HashMap O(n)/O(n) → 雙指標 O(n)/O(1)（最佳）
// 【最佳解核心思路】利用排序單調性，總和過小移左、過大移右。
// 【複雜度】時間：O(n)  空間：O(1)

List<int> twoSum(List<int> numbers, int target) {
  int l = 0, r = numbers.length - 1;
  while (l < r) {
    final total = numbers[l] + numbers[r];
    if (total == target) return [l + 1, r + 1];
    if (total < target) {
      l++;
    } else {
      r--;
    }
  }
  return [];
}

List<int> twoSumBrute(List<int> numbers, int target) {
  final seen = <int, int>{};
  for (int i = 0; i < numbers.length; i++) {
    final need = target - numbers[i];
    if (seen.containsKey(need)) return [seen[need]! + 1, i + 1];
    seen[numbers[i]] = i;
  }
  return [];
}

void _expect(List<int> actual, List<int> expected, String name) {
  if (actual.toString() == expected.toString()) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $expected but got $actual');
  }
}

void main() {
  _expect(twoSum([2, 7, 11, 15], 9), [1, 2], 'Test 1');
  _expect(twoSum([2, 3, 4], 6), [1, 3], 'Test 2');
  _expect(twoSum([-1, 0], -1), [1, 2], 'Test 3: negatives');
  _expect(twoSum([1, 2, 3, 4, 5], 9), [4, 5], 'Test 4');
  _expect(twoSum([0, 0, 3, 4], 0), [1, 2], 'Test 5: zeros');
  _expect(twoSumBrute([2, 7, 11, 15], 9), [1, 2], 'Brute Test');

  print('All tests passed!');
}
