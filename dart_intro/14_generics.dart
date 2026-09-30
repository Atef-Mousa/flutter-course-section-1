// Lesson 14 — Generics

// A generic class works with any type T
class Box<T> {
  T value;
  Box(this.value);

  T open() => value;
}

// Type bound: T must be a num (int or double)
class Stats<T extends num> {
  final List<T> items;
  Stats(this.items);

  double average() {
    num total = 0;
    for (var item in items) {
      total += item;
    }
    return total / items.length;
  }
}

// Generic function
T firstOrDefault<T>(List<T> list, T defaultValue) {
  return list.isEmpty ? defaultValue : list.first;
}

// Two type parameters
class Pair<K, V> {
  final K key;
  final V value;
  Pair(this.key, this.value);

  @override
  String toString() => '($key, $value)';
}

void main() {
  var intBox = Box<int>(10);
  var strBox = Box('hello'); // inferred as Box<String>
  print('${intBox.open()} ${strBox.open()}');

  print(Stats([1, 2, 3, 4]).average());
  print(Stats([2.5, 3.5]).average());
  // Stats(['a']); // Error: String is not a num

  print(firstOrDefault<String>([], 'empty'));
  print(firstOrDefault([7, 8, 9], 0));

  var pairs = [Pair('Ali', 90), Pair('Sara', 95)];
  print(pairs);

  // Collections are generic too
  List<String> names = ['a', 'b'];
  Map<String, List<int>> scores = {
    'Ali': [90, 85],
  };
  print('$names $scores');
}
