// Problem: 0981. Time Based Key-Value Store
// Difficulty: Medium

class TimeMap {
  final Map<String, List<MapEntry<int, String>>> _store = {};

  void set(String key, String value, int timestamp) {
    _store.putIfAbsent(key, () => []).add(MapEntry(timestamp, value));
  }

  String get(String key, int timestamp) {
    final arr = _store[key];
    if (arr == null || arr.isEmpty) return '';
    int l = 0, r = arr.length - 1;
    String ans = '';
    while (l <= r) {
      final mid = l + (r - l) ~/ 2;
      if (arr[mid].key <= timestamp) {
        ans = arr[mid].value;
        l = mid + 1;
      } else {
        r = mid - 1;
      }
    }
    return ans;
  }
}

void _expect(String a, String e, String msg) {
  if (a != e) throw StateError('FAIL $msg: "$a" vs "$e"');
}

void main() {
  final tm = TimeMap();
  tm.set('foo', 'bar', 1);
  _expect(tm.get('foo', 1), 'bar', 'g1');
  _expect(tm.get('foo', 3), 'bar', 'g3');
  tm.set('foo', 'bar2', 4);
  _expect(tm.get('foo', 4), 'bar2', 'g4');
  _expect(tm.get('foo', 5), 'bar2', 'g5');
  _expect(tm.get('foo', 0), '', 'before');
  _expect(tm.get('missing', 10), '', 'missing');

  tm.set('a', 'v1', 2);
  tm.set('a', 'v2', 5);
  _expect(tm.get('a', 4), 'v1', 'a4');
  _expect(tm.get('a', 5), 'v2', 'a5');
  print('All tests passed!');
}
