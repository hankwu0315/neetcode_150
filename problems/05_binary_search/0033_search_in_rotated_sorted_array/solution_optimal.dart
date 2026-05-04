// Problem: 0033. Search in Rotated Sorted Array
// Difficulty: Medium

int search(List<int> nums, int target) {
  int l = 0, r = nums.length - 1;
  while (l <= r) {
    final mid = l + (r - l) ~/ 2;
    if (nums[mid] == target) return mid;
    if (nums[l] <= nums[mid]) {
      if (nums[l] <= target && target < nums[mid]) {
        r = mid - 1;
      } else {
        l = mid + 1;
      }
    } else {
      if (nums[mid] < target && target <= nums[r]) {
        l = mid + 1;
      } else {
        r = mid - 1;
      }
    }
  }
  return -1;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(search([4, 5, 6, 7, 0, 1, 2], 0), 4, 'ex1');
  _expect(search([4, 5, 6, 7, 0, 1, 2], 3), -1, 'ex2');
  _expect(search([1], 0), -1, 'single miss');
  _expect(search([1], 1), 0, 'single hit');
  _expect(search([1, 2, 3, 4, 5], 3), 2, 'unrotated');
  _expect(search([4, 5, 6, 7, 0, 1, 2], 4), 0, 'left end');
  _expect(search([4, 5, 6, 7, 0, 1, 2], 2), 6, 'right end');
  _expect(search([3, 1], 1), 1, 'two');
  print('All tests passed!');
}
