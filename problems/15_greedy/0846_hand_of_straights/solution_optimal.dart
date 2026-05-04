// 0846. Hand of Straights
bool isNStraightHand(List<int> hand, int groupSize) {
  if (hand.length % groupSize != 0) return false;
  final cnt = <int, int>{};
  for (final x in hand) cnt[x] = (cnt[x] ?? 0) + 1;
  final keys = cnt.keys.toList()..sort();
  for (final x in keys) {
    final c = cnt[x] ?? 0;
    if (c <= 0) continue;
    for (var k = 0; k < groupSize; k++) {
      final v = cnt[x + k] ?? 0;
      if (v < c) return false;
      cnt[x + k] = v - c;
    }
  }
  return true;
}
void main() {
  if (isNStraightHand([1, 2, 3, 6, 2, 3, 4, 7, 8], 3) != true) throw 'a';
  if (isNStraightHand([1, 2, 3, 4, 5], 4) != false) throw 'b';
  if (isNStraightHand([1, 2, 3, 4, 5, 6], 2) != true) throw 'c';
  if (isNStraightHand([1], 1) != true) throw 'd';
  if (isNStraightHand([8, 8, 9, 7, 7, 7, 6, 7, 9], 3) != false) throw 'e';
  print('All tests passed!');
}
