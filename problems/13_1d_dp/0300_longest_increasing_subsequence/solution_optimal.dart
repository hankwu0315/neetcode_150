// 0300. Longest Increasing Subsequence
int lengthOfLIS(List<int> nums) {
  final tails = <int>[];
  for (final x in nums) {
    var lo = 0, hi = tails.length;
    while (lo < hi) {
      final m = (lo + hi) >> 1;
      if (tails[m] < x) lo = m + 1; else hi = m;
    }
    if (lo == tails.length) tails.add(x); else tails[lo] = x;
  }
  return tails.length;
}
void main() {
  if (lengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18]) != 4) throw 'a';
  if (lengthOfLIS([0, 1, 0, 3, 2, 3]) != 4) throw 'b';
  if (lengthOfLIS([7, 7, 7, 7]) != 1) throw 'c';
  if (lengthOfLIS([]) != 0) throw 'd';
  if (lengthOfLIS([1]) != 1) throw 'e';
  if (lengthOfLIS([4, 10, 4, 3, 8, 9]) != 3) throw 'f';
  print('All tests passed!');
}
