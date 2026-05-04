// 0213. House Robber II
import 'dart:math';
int _linear(List<int> a, int lo, int hi) {
  var p2 = 0, p1 = 0;
  for (var i = lo; i < hi; i++) {
    final cur = max(p1, p2 + a[i]);
    p2 = p1; p1 = cur;
  }
  return p1;
}
int rob(List<int> nums) {
  if (nums.isEmpty) return 0;
  if (nums.length == 1) return nums[0];
  return max(_linear(nums, 1, nums.length), _linear(nums, 0, nums.length - 1));
}
void main() {
  if (rob([2, 3, 2]) != 3) throw 'a';
  if (rob([1, 2, 3, 1]) != 4) throw 'b';
  if (rob([1, 2, 3]) != 3) throw 'c';
  if (rob([]) != 0) throw 'd';
  if (rob([5]) != 5) throw 'e';
  if (rob([1, 2]) != 2) throw 'f';
  print('All tests passed!');
}
