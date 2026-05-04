// 0134. Gas Station
int canCompleteCircuit(List<int> gas, List<int> cost) {
  var sg = 0, sc = 0;
  for (final x in gas) sg += x;
  for (final x in cost) sc += x;
  if (sg < sc) return -1;
  var start = 0, tank = 0;
  for (var i = 0; i < gas.length; i++) {
    tank += gas[i] - cost[i];
    if (tank < 0) { start = i + 1; tank = 0; }
  }
  return start;
}
void main() {
  if (canCompleteCircuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]) != 3) throw 'a';
  if (canCompleteCircuit([2, 3, 4], [3, 4, 3]) != -1) throw 'b';
  if (canCompleteCircuit([5], [4]) != 0) throw 'c';
  if (canCompleteCircuit([5], [6]) != -1) throw 'd';
  if (canCompleteCircuit([4, 5, 2, 6, 5, 3], [3, 2, 7, 3, 2, 9]) != -1) throw 'e';
  print('All tests passed!');
}
