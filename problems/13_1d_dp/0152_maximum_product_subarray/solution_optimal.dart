// 0152. Maximum Product Subarray
import 'dart:math';
int maxProduct(List<int> nums) {
  var ans = nums[0], mx = nums[0], mn = nums[0];
  for (var i = 1; i < nums.length; i++) {
    final x = nums[i];
    final a = x, b = x * mx, c = x * mn;
    final nmx = max(a, max(b, c));
    final nmn = min(a, min(b, c));
    mx = nmx; mn = nmn;
    if (mx > ans) ans = mx;
  }
  return ans;
}
void main() {
  if (maxProduct([2, 3, -2, 4]) != 6) throw 'a';
  if (maxProduct([-2, 0, -1]) != 0) throw 'b';
  if (maxProduct([-2, 3, -4]) != 24) throw 'c';
  if (maxProduct([0, 2]) != 2) throw 'd';
  if (maxProduct([-2]) != -2) throw 'e';
  if (maxProduct([2, -5, -2, -4, 3]) != 24) throw 'f';
  print('All tests passed!');
}
