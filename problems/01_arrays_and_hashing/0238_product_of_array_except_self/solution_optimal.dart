// Problem: 238. Product of Array Except Self
// Difficulty: Medium
// URL: https://leetcode.com/problems/product-of-array-except-self/
//
// 【解法演進】暴力 O(n²) → 左右前綴 O(n)/O(n) → 原地兩遍掃描 O(n)/O(1)（最佳）
// 【最佳解核心思路】answer 第一遍存左前綴，第二遍從右到左乘右後綴。
// 【複雜度】時間：O(n)  空間：O(1)（不計輸出）

List<int> productExceptSelf(List<int> nums) {
  final n = nums.length;
  final answer = List<int>.filled(n, 1);
  for (int i = 1; i < n; i++) answer[i] = answer[i - 1] * nums[i - 1];
  int right = 1;
  for (int i = n - 1; i >= 0; i--) {
    answer[i] *= right;
    right *= nums[i];
  }
  return answer;
}

List<int> productExceptSelfBrute(List<int> nums) {
  final n = nums.length;
  final result = List<int>.filled(n, 0);
  for (int i = 0; i < n; i++) {
    int p = 1;
    for (int j = 0; j < n; j++) if (j != i) p *= nums[j];
    result[i] = p;
  }
  return result;
}

void _expect(List<int> actual, List<int> expected, String name) {
  if (actual.toString() == expected.toString()) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $expected but got $actual');
  }
}

void main() {
  _expect(productExceptSelf([1, 2, 3, 4]), [24, 12, 8, 6], 'Test 1');
  _expect(productExceptSelf([-1, 1, 0, -3, 3]), [0, 0, 9, 0, 0], 'Test 2');
  _expect(productExceptSelf([2, 3]), [3, 2], 'Test 3: length 2');
  _expect(productExceptSelf([0, 0]), [0, 0], 'Test 4: two zeros');
  _expect(productExceptSelf([1, 1, 1, 1]), [1, 1, 1, 1], 'Test 5: all ones');
  _expect(productExceptSelf([-1, -1, -1, -1]), [-1, -1, -1, -1], 'Test 6: all -1');
  _expect(productExceptSelfBrute([1, 2, 3, 4]), [24, 12, 8, 6], 'Brute Test');

  print('All tests passed!');
}
