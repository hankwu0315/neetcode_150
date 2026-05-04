// 0055. Jump Game
bool canJump(List<int> nums) {
  var reach = 0;
  for (var i = 0; i < nums.length; i++) {
    if (i > reach) return false;
    if (i + nums[i] > reach) reach = i + nums[i];
  }
  return true;
}
void main() {
  if (canJump([2, 3, 1, 1, 4]) != true) throw 'a';
  if (canJump([3, 2, 1, 0, 4]) != false) throw 'b';
  if (canJump([0]) != true) throw 'c';
  if (canJump([2, 0]) != true) throw 'd';
  if (canJump([1, 0, 1]) != false) throw 'e';
  if (canJump([2, 0, 0]) != true) throw 'f';
  print('All tests passed!');
}
