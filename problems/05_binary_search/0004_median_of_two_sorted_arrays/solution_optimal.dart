// Problem: 0004. Median of Two Sorted Arrays
// Difficulty: Hard
// 二分切割。O(log min(m,n))。

double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  if (nums1.length > nums2.length) {
    final t = nums1;
    nums1 = nums2;
    nums2 = t;
  }
  final m = nums1.length, n = nums2.length;
  final half = (m + n + 1) ~/ 2;
  const inf = 1 << 62;
  int l = 0, r = m;
  while (l <= r) {
    final i = (l + r) ~/ 2;
    final j = half - i;
    final l1 = i > 0 ? nums1[i - 1] : -inf;
    final r1 = i < m ? nums1[i] : inf;
    final l2 = j > 0 ? nums2[j - 1] : -inf;
    final r2 = j < n ? nums2[j] : inf;
    if (l1 <= r2 && l2 <= r1) {
      if ((m + n).isOdd) {
        return (l1 > l2 ? l1 : l2).toDouble();
      }
      final lm = l1 > l2 ? l1 : l2;
      final rm = r1 < r2 ? r1 : r2;
      return (lm + rm) / 2.0;
    }
    if (l1 > r2) {
      r = i - 1;
    } else {
      l = i + 1;
    }
  }
  return 0.0;
}

void _expect(double a, double e, String msg) {
  if ((a - e).abs() > 1e-9) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(findMedianSortedArrays([1, 3], [2]), 2.0, 'ex1');
  _expect(findMedianSortedArrays([1, 2], [3, 4]), 2.5, 'ex2');
  _expect(findMedianSortedArrays([], [1]), 1.0, 'left empty');
  _expect(findMedianSortedArrays([2], []), 2.0, 'right empty');
  _expect(findMedianSortedArrays([1, 2], [3, 4, 5]), 3.0, 'odd');
  _expect(findMedianSortedArrays([1, 2, 3], [10, 20, 30]), 6.5, 'no overlap');
  _expect(findMedianSortedArrays([-5, -3], [-2, 0]), -2.5, 'neg');
  print('All tests passed!');
}
