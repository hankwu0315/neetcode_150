// 0136. Single Number
int singleNumber(List<int> nums) {
  var x = 0;
  for (final v in nums) x ^= v;
  return x;
}
void main() {
  if (singleNumber([2, 2, 1]) != 1) throw 'a';
  if (singleNumber([4, 1, 2, 1, 2]) != 4) throw 'b';
  if (singleNumber([1]) != 1) throw 'c';
  if (singleNumber([7, 3, 5, 4, 5, 3, 4]) != 7) throw 'd';
  print('All tests passed!');
}
