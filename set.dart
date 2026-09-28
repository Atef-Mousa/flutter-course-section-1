void main() {
  var numbers = <int>{10, 20, 30, 40};

  // print(numbers.length); // 4
  // print(numbers.isEmpty); // false
  // print(numbers.isNotEmpty); // true
  // print(numbers.first); // 10 (insertion order for LinkedHashSet)
  // print(numbers.last); // 40

  // numbers.add(50); // adds 50 → duplicates are silently ignored
  // numbers.addAll({60, 70}); // adds multiple values at once
  // print(
  //   numbers.contains(20),
  // ); // true — O(1) average, this is the main selling point
  // print(numbers.containsAll({20, 30}));
}
