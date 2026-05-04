// Problem: 0853. Car Fleet
// Difficulty: Medium
// URL: https://leetcode.com/problems/car-fleet/
//
// 最佳解：排序 + 一次掃描。O(n log n) / O(n)。

int carFleet(int target, List<int> position, List<int> speed) {
  final n = position.length;
  final cars = List.generate(n, (i) => [position[i], speed[i]]);
  cars.sort((a, b) => b[0].compareTo(a[0])); // 由大到小

  int fleets = 0;
  double maxTime = 0;
  for (final c in cars) {
    final t = (target - c[0]) / c[1];
    if (t > maxTime) {
      fleets++;
      maxTime = t;
    }
  }
  return fleets;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(carFleet(12, [10, 8, 0, 5, 3], [2, 4, 1, 1, 3]), 3, 'ex1');
  _expect(carFleet(10, [3], [3]), 1, 'ex2');
  _expect(carFleet(100, [0, 2, 4], [4, 2, 1]), 1, 'ex3');
  _expect(carFleet(10, [6, 8], [3, 2]), 2, 'split');
  _expect(carFleet(10, [0, 4, 2], [2, 1, 3]), 1, 'merge');
  _expect(carFleet(10, [0, 5], [1, 1]), 2, 'two');
  print('All tests passed!');
}
