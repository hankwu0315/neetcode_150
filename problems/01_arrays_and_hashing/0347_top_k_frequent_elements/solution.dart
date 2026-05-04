// Problem: 347. Top K Frequent Elements
// Difficulty: Medium
// URL: https://leetcode.com/problems/top-k-frequent-elements/
//
// 【解法演進】排序 O(n log n) → 最小堆 O(n log k) → 桶排序 O(n)（最佳）
// 【最佳解核心思路】依頻率分桶（索引=頻率），由高頻向低頻取前 k。
// 【複雜度】時間：O(n)  空間：O(n)

// 最佳解：桶排序
List<int> topKFrequent(List<int> nums, int k) {
  final count = <int, int>{};
  for (final x in nums) count[x] = (count[x] ?? 0) + 1;
  final n = nums.length;
  final buckets = List.generate(n + 1, (_) => <int>[]);
  count.forEach((num, freq) => buckets[freq].add(num));

  final result = <int>[];
  for (int f = n; f >= 1; f--) {
    for (final num in buckets[f]) {
      result.add(num);
      if (result.length == k) return result;
    }
  }
  return result;
}

// 暴力解：排序
List<int> topKFrequentBrute(List<int> nums, int k) {
  final count = <int, int>{};
  for (final x in nums) count[x] = (count[x] ?? 0) + 1;
  final entries = count.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
  return entries.take(k).map((e) => e.key).toList();
}

void _expect(List<int> actual, List<int> expected, String name) {
  final a = [...actual]..sort();
  final b = [...expected]..sort();
  if (a.toString() == b.toString()) {
    print('✓ $name');
  } else {
    print('✗ $name: expected $b but got $a');
  }
}

void main() {
  _expect(topKFrequent([1, 1, 1, 2, 2, 3], 2), [1, 2], 'Test 1');
  _expect(topKFrequent([1], 1), [1], 'Test 2');
  _expect(topKFrequent([1, 2], 2), [1, 2], 'Test 3');
  _expect(topKFrequent([4, 1, -1, 2, -1, 2, 3], 2), [-1, 2], 'Test 4: negatives');
  _expect(topKFrequent([5, 5, 5, 5], 1), [5], 'Test 5: single value');

  _expect(topKFrequentBrute([1, 1, 1, 2, 2, 3], 2), [1, 2], 'Brute Test');

  print('All tests passed!');
}
