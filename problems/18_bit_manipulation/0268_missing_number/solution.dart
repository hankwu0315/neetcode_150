// 0268. Missing Number
int missingNumber(List<int> nums) {
  var x = nums.length;
  for (var i = 0; i < nums.length; i++) x ^= i ^ nums[i];
  return x;
}
void main() {
  if (missingNumber([3, 0, 1]) != 2) throw 'a';
  if (missingNumber([0, 1]) != 2) throw 'b';
  if (missingNumber([9, 6, 4, 2, 3, 5, 7, 0, 1]) != 8) throw 'c';
  if (missingNumber([0]) != 1) throw 'd';
  if (missingNumber([1]) != 0) throw 'e';
  print('All tests passed!');
}
