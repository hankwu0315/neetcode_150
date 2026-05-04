// Problem: 0704. Binary Search
// Difficulty: Easy
// URL: https://leetcode.com/problems/binary-search/

int search(List<int> nums, int target) {
  int l = 0, r = nums.length - 1;
  while (l <= r) {
    final mid = l + (r - l) ~/ 2;
    if (nums[mid] == target) return mid;
    if (nums[mid] < target) {
      l = mid + 1;
    } else {
      r = mid - 1;
    }
  }
  return -1;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(search([-1, 0, 3, 5, 9, 12], 9), 4, 'ex1');
  _expect(search([-1, 0, 3, 5, 9, 12], 2), -1, 'ex2');
  _expect(search([5], 5), 0, 'single hit');
  _expect(search([5], 3), -1, 'single miss');
  _expect(search([1, 2, 3, 4, 5], 1), 0, 'first');
  _expect(search([1, 2, 3, 4, 5], 5), 4, 'last');
  print('All tests passed!');
}
