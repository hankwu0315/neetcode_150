// Problem: 217. Contains Duplicate
// Difficulty: Easy
// URL: https://leetcode.com/problems/contains-duplicate/
//
// 【解法演進】暴力 O(n²) → 排序 O(n log n) → HashSet O(n)（最佳）
// 【最佳解核心思路】
//   走訪陣列維護 seen 集合，遇到已見元素即回傳 true。
// 【複雜度】時間：O(n)  空間：O(n)

// 最佳解：HashSet
bool containsDuplicate(List<int> nums) {
  final seen = <int>{};
  for (final x in nums) {
    if (!seen.add(x)) return true; // add 回傳 false 表已存在
  }
  return false;
}

// 暴力解：兩兩比較
bool containsDuplicateBrute(List<int> nums) {
  for (int i = 0; i < nums.length; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      if (nums[i] == nums[j]) return true;
    }
  }
  return false;
}

// 排序後比鄰
bool containsDuplicateSort(List<int> nums) {
  final arr = [...nums]..sort();
  for (int i = 1; i < arr.length; i++) {
    if (arr[i] == arr[i - 1]) return true;
  }
  return false;
}

void _expect(dynamic actual, dynamic expected, String name) {
  if (actual == expected) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $expected but got $actual');
  }
}

void main() {
  _expect(containsDuplicate([1, 2, 3, 1]), true, 'Test 1: basic dup');
  _expect(containsDuplicate([1, 2, 3, 4]), false, 'Test 2: no dup');
  _expect(containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]), true, 'Test 3: many dups');
  _expect(containsDuplicate([1]), false, 'Test 4: single');
  _expect(containsDuplicate([-1, -1]), true, 'Test 5: negatives');

  _expect(containsDuplicateBrute([1, 2, 3, 1]), true, 'Brute Test 1');
  _expect(containsDuplicateSort([1, 2, 3, 4]), false, 'Sort Test 1');

  print('All tests passed!');
}
