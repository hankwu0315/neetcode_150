// Problem: 0621. Task Scheduler
// Difficulty: Medium

int leastInterval(List<String> tasks, int n) {
  final cnt = <String, int>{};
  for (final t in tasks) cnt[t] = (cnt[t] ?? 0) + 1;
  var maxF = 0;
  for (final v in cnt.values) if (v > maxF) maxF = v;
  var maxCount = 0;
  for (final v in cnt.values) if (v == maxF) maxCount++;
  final formula = (maxF - 1) * (n + 1) + maxCount;
  return tasks.length > formula ? tasks.length : formula;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(leastInterval(['A', 'A', 'A', 'B', 'B', 'B'], 2), 8, 'ex1');
  _expect(leastInterval(['A', 'A', 'A', 'B', 'B', 'B'], 0), 6, 'no cool');
  _expect(leastInterval(['A', 'A', 'A', 'A', 'A', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], 2), 16, 'big');
  _expect(leastInterval(['A'], 2), 1, 'one');
  _expect(leastInterval(['A', 'B', 'C', 'D'], 2), 4, 'all unique');
  _expect(leastInterval(['A', 'A', 'B', 'B'], 2), 5, 'mix');
  print('All tests passed!');
}
