// Problem: 0153. Find Minimum in Rotated Sorted Array
// Difficulty: Medium

int findMin(List<int> nums) {
  int l = 0, r = nums.length - 1;
  while (l < r) {
    final mid = l + (r - l) ~/ 2;
    if (nums[mid] > nums[r]) {
      l = mid + 1;
    } else {
      r = mid;
    }
  }
  return nums[l];
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(findMin([3, 4, 5, 1, 2]), 1, 'ex1');
  _expect(findMin([4, 5, 6, 7, 0, 1, 2]), 0, 'ex2');
  _expect(findMin([11, 13, 15, 17]), 11, 'sorted');
  _expect(findMin([2, 1]), 1, 'two');
  _expect(findMin([1]), 1, 'single');
  _expect(findMin([1, 2]), 1, 'asc2');
  _expect(findMin([2, 3, 4, 5, 1]), 1, 'last min');
  print('All tests passed!');
}
