// 0252. Meeting Rooms
bool canAttendMeetings(List<List<int>> intervals) {
  final a = [...intervals];
  a.sort((x, y) => x[0].compareTo(y[0]));
  for (var i = 1; i < a.length; i++) {
    if (a[i][0] < a[i - 1][1]) return false;
  }
  return true;
}
void main() {
  if (canAttendMeetings([[0, 30], [5, 10], [15, 20]]) != false) throw 'a';
  if (canAttendMeetings([[7, 10], [2, 4]]) != true) throw 'b';
  if (canAttendMeetings([]) != true) throw 'c';
  if (canAttendMeetings([[1, 5]]) != true) throw 'd';
  if (canAttendMeetings([[1, 5], [5, 10]]) != true) throw 'e';
  if (canAttendMeetings([[1, 5], [4, 10]]) != false) throw 'f';
  print('All tests passed!');
}
