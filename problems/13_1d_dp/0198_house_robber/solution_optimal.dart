// 0198. House Robber
import 'dart:math';
int rob(List<int> nums) {
  var p2 = 0, p1 = 0;
  for (final x in nums) {
    final cur = max(p1, p2 + x);
    p2 = p1; p1 = cur;
  }
  return p1;
}
void main() {
  if (rob([1, 2, 3, 1]) != 4) throw 'a';
  if (rob([2, 7, 9, 3, 1]) != 12) throw 'b';
  if (rob([]) != 0) throw 'c';
  if (rob([5]) != 5) throw 'd';
  if (rob([2, 1]) != 2) throw 'e';
  if (rob([2, 1, 1, 2]) != 4) throw 'f';
  print('All tests passed!');
}
