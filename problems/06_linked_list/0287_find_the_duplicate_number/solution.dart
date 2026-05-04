// Problem: 0287. Find the Duplicate Number
// Difficulty: Medium

int findDuplicate(List<int> nums) {
  var slow = 0, fast = 0;
  while (true) {
    slow = nums[slow];
    fast = nums[nums[fast]];
    if (slow == fast) break;
  }
  slow = 0;
  while (slow != fast) { slow = nums[slow]; fast = nums[fast]; }
  return slow;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(findDuplicate([1, 3, 4, 2, 2]), 2, 'ex1');
  _expect(findDuplicate([3, 1, 3, 4, 2]), 3, 'ex2');
  _expect(findDuplicate([1, 1]), 1, 'two');
  _expect(findDuplicate([2, 2, 2, 2, 2]), 2, 'all same');
  _expect(findDuplicate([1, 4, 4, 2, 4]), 4, 'multi');
  print('All tests passed!');
}
