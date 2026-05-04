// 0045. Jump Game II
int jump(List<int> nums) {
  var jumps = 0, end = 0, farthest = 0;
  for (var i = 0; i < nums.length - 1; i++) {
    if (i + nums[i] > farthest) farthest = i + nums[i];
    if (i == end) { jumps++; end = farthest; }
  }
  return jumps;
}
void main() {
  if (jump([2, 3, 1, 1, 4]) != 2) throw 'a';
  if (jump([2, 3, 0, 1, 4]) != 2) throw 'b';
  if (jump([1]) != 0) throw 'c';
  if (jump([1, 2]) != 1) throw 'd';
  if (jump([1, 1, 1, 1]) != 3) throw 'e';
  if (jump([5, 1, 1, 1, 1]) != 1) throw 'f';
  print('All tests passed!');
}
