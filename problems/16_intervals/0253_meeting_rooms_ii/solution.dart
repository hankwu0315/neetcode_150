// 0253. Meeting Rooms II
int minMeetingRooms(List<List<int>> intervals) {
  if (intervals.isEmpty) return 0;
  final starts = intervals.map((x) => x[0]).toList()..sort();
  final ends = intervals.map((x) => x[1]).toList()..sort();
  var rooms = 0, used = 0, j = 0;
  for (final s in starts) {
    if (s < ends[j]) {
      used++;
      if (used > rooms) rooms = used;
    } else {
      j++;
    }
  }
  return rooms;
}
void main() {
  if (minMeetingRooms([[0, 30], [5, 10], [15, 20]]) != 2) throw 'a';
  if (minMeetingRooms([[7, 10], [2, 4]]) != 1) throw 'b';
  if (minMeetingRooms([]) != 0) throw 'c';
  if (minMeetingRooms([[1, 10], [2, 7], [3, 19], [8, 12], [10, 20], [11, 30]]) != 4) throw 'd';
  if (minMeetingRooms([[1, 5], [5, 10]]) != 1) throw 'e';
  print('All tests passed!');
}
