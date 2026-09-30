// Lesson 08 — Collections: List, Set, Map and their power tools

void main() {
  // ================= List (ordered, allows duplicates) =================
  List<int> numbers = [5, 3, 8, 1, 3];
  numbers.add(10);
  numbers.remove(3); // removes the first 3
  print('list: $numbers, length: ${numbers.length}, first: ${numbers.first}');
  numbers.sort();
  print('sorted: $numbers');

  // ================= Set (unique values) =================
  Set<String> tags = {'dart', 'flutter', 'dart'};
  print('set: $tags'); // {dart, flutter}
  var other = {'flutter', 'firebase'};
  print('union: ${tags.union(other)}');
  print('intersection: ${tags.intersection(other)}');

  // ================= Map (key -> value) =================
  Map<String, int> ages = {'Ali': 20, 'Sara': 22};
  ages['Omar'] = 19;
  print('map: $ages');
  print('Sara is ${ages['Sara']}');
  print('has Ali? ${ages.containsKey('Ali')}');
  ages.forEach((name, age) => print('$name -> $age'));
  for (var entry in ages.entries) {
    print('entry ${entry.key}: ${entry.value}');
  }

  // ================= Functional methods =================
  var nums = [1, 2, 3, 4, 5, 6];
  print('map x2: ${nums.map((n) => n * 2).toList()}');
  print('where even: ${nums.where((n) => n.isEven).toList()}');
  print('reduce sum: ${nums.reduce((a, b) => a + b)}');
  print('fold sum: ${nums.fold<int>(0, (sum, n) => sum + n)}');
  print('any > 5: ${nums.any((n) => n > 5)}');
  print('every > 0: ${nums.every((n) => n > 0)}');
  print('firstWhere > 3: ${nums.firstWhere((n) => n > 3)}');
  print('take 2: ${nums.take(2).toList()}, skip 4: ${nums.skip(4).toList()}');

  // ================= Spread, collection-if, collection-for =================
  var base = [1, 2];
  bool includeExtra = true;
  var combined = [
    0,
    ...base, // spread
    if (includeExtra) 99, // collection if
    for (var i in base) i * 10, // collection for
  ];
  print('combined: $combined');

  List<int>? maybeNull;
  var safe = [...?maybeNull, 1]; // null-aware spread
  print('safe: $safe');

  // ================= Unmodifiable =================
  const fixed = [1, 2, 3];
  // fixed.add(4); // Runtime error: const lists can't change
  print('const list: $fixed');
}
