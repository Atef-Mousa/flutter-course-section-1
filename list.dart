void main() {
  var list = [10, 20, 30, 40, 50];

  // print(list.length); // 5
  // print(list.isEmpty); // false
  // print(list.isNotEmpty); // true
  // print(list.first); // 10
  // print(list.last); // 50
  // print(list.reversed);

  // list.add(60); // adds to the end → [10, 20, 30, 40, 50, 60]
  // list.addAll([70, 80]); // adds multiple → [..., 70, 80]
  // list.insert(0, 5); // insert at specific index
  // list.insertAll(1, [6, 7]);
  // print(list);

  // list.remove(30); // removes first occurrence of value 30
  // print(list);
  // list.removeAt(0); // removes element at index 0
  // print(list);
  // list.removeLast(); // removes and returns the last element
  // print(list);
  // list.removeWhere((x) => x > 40); // removes all matching a condition
  // print(list);
  // list.clear();
  // print(list);

  // print(list.contains(30)); // true — is value present?
  // print(list.indexOf(30)); // index of first occurrence (-1 if not found)
  // print(list.lastIndexOf(30)); // index of last occurrence
  // print(list.firstWhere((x) => x > 20)); // first element matching condition

  // print(list.map((x) => x * 2).toList()); // [20, 40, 60, 80, 100]
  // print(list.where((x) => x > 20).toList()); // filters → [30, 40, 50]
  // print(list.reduce((a, b) => a + b)); // combines all → sum

  // print(list.join(', '));
}
