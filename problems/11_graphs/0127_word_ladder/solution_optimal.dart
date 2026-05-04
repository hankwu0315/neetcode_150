// Problem: 0127. Word Ladder
// Difficulty: Hard

import 'dart:collection';

int ladderLength(String beginWord, String endWord, List<String> wordList) {
  final ws = wordList.toSet();
  if (!ws.contains(endWord)) return 0;
  final L = beginWord.length;
  final buckets = <String, List<String>>{};
  void add(String w) {
    for (var i = 0; i < L; i++) {
      final key = w.substring(0, i) + '*' + w.substring(i + 1);
      buckets.putIfAbsent(key, () => <String>[]).add(w);
    }
  }
  add(beginWord);
  for (final w in ws) if (w != beginWord) add(w);
  final visited = <String>{beginWord};
  final q = Queue<List<dynamic>>();
  q.add([beginWord, 1]);
  while (q.isNotEmpty) {
    final p = q.removeFirst();
    final word = p[0] as String;
    final d = p[1] as int;
    for (var i = 0; i < L; i++) {
      final key = word.substring(0, i) + '*' + word.substring(i + 1);
      final lst = buckets[key];
      if (lst == null) continue;
      for (final nb in lst) {
        if (nb == endWord) return d + 1;
        if (!visited.contains(nb)) {
          visited.add(nb);
          q.add([nb, d + 1]);
        }
      }
      buckets[key] = <String>[];
    }
  }
  return 0;
}

void _expect(int a, int e, String msg) {
  if (a != e) throw StateError('FAIL $msg: $a vs $e');
}

void main() {
  _expect(ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]), 5, 'a');
  _expect(ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log"]), 0, 'b');
  _expect(ladderLength("a", "c", ["a", "b", "c"]), 2, 'c');
  _expect(ladderLength("hot", "dog", ["hot", "dog"]), 0, 'd');
  _expect(ladderLength("hot", "dog", ["hot", "dog", "dot"]), 3, 'e');
  _expect(ladderLength("leet", "code",
      ["lest", "leet", "lose", "code", "lode", "robe", "lost"]), 6, 'f');
  print('All tests passed!');
}
