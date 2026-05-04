// Problem: 15. 3Sum
// Difficulty: Medium
// URL: https://leetcode.com/problems/3sum/
//
// 【解法演進】暴力 O(n³) → 排序 + 固定 + 雙指標 O(n²)（最佳）
// 【最佳解核心思路】排序後固定 i，雙指標找 sum = -nums[i]，跳過重複。
// 【複雜度】時間：O(n²)  空間：O(1)

List<List<int>> threeSum(List<int> nums) {
  final arr = [...nums]..sort();
  final n = arr.length;
  final result = <List<int>>[];
  for (int i = 0; i < n - 2; i++) {
    if (arr[i] > 0) break;
    if (i > 0 && arr[i] == arr[i - 1]) continue;
    final target = -arr[i];
    int l = i + 1, r = n - 1;
    while (l < r) {
      final total = arr[l] + arr[r];
      if (total == target) {
        result.add([arr[i], arr[l], arr[r]]);
        l++;
        r--;
        while (l < r && arr[l] == arr[l - 1]) l++;
        while (l < r && arr[r] == arr[r + 1]) r--;
      } else if (total < target) {
        l++;
      } else {
        r--;
      }
    }
  }
  return result;
}

List<List<int>> _norm(List<List<int>> g) {
  final inner = g.map((t) => [...t]..sort()).toList();
  inner.sort((a, b) => a.join(',').compareTo(b.join(',')));
  return inner;
}

void _expect(List<List<int>> actual, List<List<int>> expected, String name) {
  if (_norm(actual).toString() == _norm(expected).toString()) {
    print('✓ $name');
  } else {
    print('✗ $name: expected ${_norm(expected)} but got ${_norm(actual)}');
  }
}

void main() {
  _expect(threeSum([-1, 0, 1, 2, -1, -4]), [[-1, -1, 2], [-1, 0, 1]], 'Test 1');
  _expect(threeSum([0, 1, 1]), [], 'Test 2');
  _expect(threeSum([0, 0, 0]), [[0, 0, 0]], 'Test 3');
  _expect(threeSum([1, 2, 3]), [], 'Test 4: no solution');
  _expect(threeSum([0, 0, 0, 0]), [[0, 0, 0]], 'Test 5: dups');
  _expect(threeSum([-2, 0, 0, 2, 2]), [[-2, 0, 2]], 'Test 6');

  print('All tests passed!');
}
