// Problem: 0269. Alien Dictionary
// Difficulty: Hard

import 'dart:collection';

String alienOrder(List<String> words) {
  final graph = <String, Set<String>>{};
  final indeg = <String, int>{};
  for (final w in words) {
    for (final c in w.split('')) {
      graph.putIfAbsent(c, () => <String>{});
      indeg.putIfAbsent(c, () => 0);
    }
  }
  for (var i = 0; i < words.length - 1; i++) {
    final a = words[i], b = words[i + 1];
    final ml = a.length < b.length ? a.length : b.length;
    if (a.length > b.length && a.substring(0, ml) == b.substring(0, ml)) {
      return "";
    }
    for (var j = 0; j < ml; j++) {
      if (a[j] != b[j]) {
        final s = graph[a[j]]!;
        if (!s.contains(b[j])) {
          s.add(b[j]);
          indeg[b[j]] = indeg[b[j]]! + 1;
        }
        break;
      }
    }
  }
  final q = Queue<String>();
  indeg.forEach((k, v) { if (v == 0) q.add(k); });
  final sb = StringBuffer();
  while (q.isNotEmpty) {
    final c = q.removeFirst();
    sb.write(c);
    for (final nb in graph[c]!) {
      indeg[nb] = indeg[nb]! - 1;
      if (indeg[nb] == 0) q.add(nb);
    }
  }
  return sb.length == indeg.length ? sb.toString() : "";
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
  final o1 = alienOrder(["wrt", "wrf", "er", "ett", "rftt"]);
  if (!_validOrder(o1, ["wrt", "wrf", "er", "ett", "rftt"])) throw 'a';
  if (alienOrder(["z", "x"]) != "zx") throw 'b';
  if (alienOrder(["z", "x", "z"]) != "") throw 'c';
  if (alienOrder(["abc", "ab"]) != "") throw 'd';
  if (alienOrder(["a"]) != "a") throw 'e';
  final o6 = alienOrder(["ab", "adc"]);
  if (!_validOrder(o6, ["ab", "adc"])) throw 'f';
  print('All tests passed!');
}
