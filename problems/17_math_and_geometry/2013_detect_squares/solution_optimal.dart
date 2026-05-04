// 2013. Detect Squares
class DetectSquares {
  final Map<int, int> cnt = {};
  final List<List<int>> points = [];
  int _key(int x, int y) => x * 2001 + y;
  void add(List<int> p) {
    cnt.update(_key(p[0], p[1]), (v) => v + 1, ifAbsent: () => 1);
    points.add([p[0], p[1]]);
  }
  int count(List<int> p) {
    final px = p[0], py = p[1];
    var total = 0;
    for (final q in points) {
      final x = q[0], y = q[1];
      if ((x - px).abs() != (y - py).abs() || x == px || y == py) continue;
      final a = cnt[_key(x, py)] ?? 0;
      final b = cnt[_key(px, y)] ?? 0;
      total += a * b;
    }
    return total;
  }
}
void main() {
  final ds = DetectSquares();
  ds.add([3, 10]); ds.add([11, 2]); ds.add([3, 2]);
  if (ds.count([11, 10]) != 1) throw 'a';
  if (ds.count([14, 8]) != 0) throw 'b';
  ds.add([11, 2]);
  if (ds.count([11, 10]) != 2) throw 'c';
  print('All tests passed!');
}
