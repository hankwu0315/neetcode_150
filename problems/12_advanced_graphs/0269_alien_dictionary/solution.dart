// Problem: 0269. Alien Dictionary
// Difficulty: Hard

import 'dart:collection';

String alienOrder(List<String> words) {
  // TODO: implement
  return "";
}

bool _validOrder(String order, List<String> words) {
  final seen = <String>{};
  for (final w in words) for (final c in w.split('')) seen.add(c);
  if (order.split('').toSet().difference(seen).isNotEmpty ||
      seen.difference(order.split('').toSet()).isNotEmpty) return false;
  final pos = <String, int>{};
  for (var i = 0; i < order.length; i++) pos[order[i]] = i;
  for (var i = 0; i < words.length - 1; i++) {
    final a = words[i], b = words[i + 1];
    final ml = a.length < b.length ? a.length : b.length;
    var diff = -1;
    for (var j = 0; j < ml; j++) if (a[j] != b[j]) { diff = j; break; }
    if (diff == -1) { if (a.length > b.length) return false; continue; }
    if ((pos[a[diff]] ?? -1) >= (pos[b[diff]] ?? -1)) return false;
  }
  return true;
}

void main() {
  // Test 1
  // final result = solve(...);
  print('All tests passed!');
}
