// 0053. Maximum Subarray
import 'dart:math';
int maxSubArray(List<int> nums) {
  var cur = nums[0], best = nums[0];
  for (var i = 1; i < nums.length; i++) {
    cur = max(nums[i], cur + nums[i]);
    if (cur > best) best = cur;
  }
  return best;
}
void main() {
  if (maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]) != 6) throw 'a';
  if (maxSubArray([1]) != 1) throw 'b';
  if (maxSubArray([5, 4, -1, 7, 8]) != 23) throw 'c';
  if (maxSubArray([-1]) != -1) throw 'd';
  if (maxSubArray([-2, -1]) != -1) throw 'e';
  if (maxSubArray([1, 2, 3, 4]) != 10) throw 'f';
  print('All tests passed!');
}
