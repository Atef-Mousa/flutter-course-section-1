void main() {
  // // var list = [1,2,3] ;
  // // print(list);
  // // print(list.runtimeType);

  // // var list_obj = [1,2,3,"any thing"];
  // // print(list_obj);
  // // print(list_obj.runtimeType);
  // // print(list_obj[3].toString());   // fine — every Object has toString()
  // // // print(list_obj[3].length);

  // // var x = "hello world ";
  // // print(x.runtimeType);
  // // print(x.length);

  // // Object xx = "hello world ";
  // // print(xx.runtimeType);
  // // // print(xx.length);

  // var list = [1, 2, 3];
  // assert(list.length == 3);

  // var set_data ={"a", "b", "c"};

  // if (set_data.contains("a")) {
  //   print("a is in the set");
  // } else {
  //   print("a is not in the set");

  // }

  // var gifts = {
  //   // Key:    Value
  //   'first': 'partridge',
  //   'second': 'turtledoves',
  //   'fifth': 'golden rings',
  // };

  // if (gifts.containsKey('first')) {
  //   print('The first gift is: ${gifts['first']}');
  // } else {
  //   print('No first gift found.');
  // }

  // // dynamic x = 'hello';
  // // print(x.length);    // works — treated as String at runtime

  // // x = 5;               // ALLOWED — dynamic can be reassigned to ANY type, unlike var
  // // print(x.length);     // COMPILES fine... but CRASHES at runtime!

  // var set1 = <String>{'apples', 'oranges', 'bananas'};
  // print(set1.runtimeType);  // prints "_CompactLinkedHashSet<String>"

  // var set2 = <Object>{'apples', 'oranges', 'bananas',2};
  // print(set2.runtimeType);  // prints "_CompactLinkedHashSet<Object>"
  // var set3 = <dynamic>{'apples', 'oranges', 'bananas',2};
  // print(set3.runtimeType);  // prints "_CompactLinkedHashSet<Object>"

  // var set4 = {'apples', 'oranges', 'bananas'};
  // print(set4.runtimeType);  // prints "_CompactLinkedHashSet<String>"

  // var dict = {
  //   'first': 'partridge',
  //   'second': 'turtledoves',
  //   'fifth': 'golden rings',
  //   };

  // print(dict.runtimeType);  // prints "_InternalLinkedHashMap<String, String>"

  // var dict2 = <String,String>{
  //   'first': 'partridge',
  //   'second': 'turtledoves',
  //   'fifth': 'golden rings',
  //   };

  //   print(dict2.runtimeType);  // prints "_InternalLinkedHashMap<String, String>"

  //   var dict_3= <String,Object>{
  //   'first': 'partridge',};

  //   print(dict_3.runtimeType);  // prints "_InternalLinkedHashMap<String, Object>"
  // for(var i in [1,2,3]){
  //     print(i);
  // }
}

// Map (Dart) ↔ Dictionary (Python)
// Operation	Python dict	Dart Map
// Create	d = {"a": 1, "b": 2}	var m = {"a": 1, "b": 2};
// Get value	d["a"]	m["a"]
// Get with default	d.get("a", 0)	m["a"] ?? 0
// Add/update entry	d["c"] = 3	m["c"] = 3;
// Remove entry	d.pop("a") (returns value)	m.remove("a") (returns value)
// Remove (no error if missing)	d.pop("x", None)	m.remove("x") (returns null if absent)
// Check key exists	"a" in d	m.containsKey("a")
// Check value exists	1 in d.values()	m.containsValue(1)
// Get all keys	d.keys()	m.keys
// Get all values	d.values()	m.values
// Get key-value pairs	d.items()	m.entries
// Number of entries	len(d)	m.length
// Clear all	d.clear()	m.clear()
// Merge two maps	d.update(d2) or d | d2	m.addAll(m2)
// Iterate	for k, v in d.items():	m.forEach((k, v) { ... }); or for (var e in m.entries)
// Empty check	not d or len(d) == 0	m.isEmpty

// Set (Dart) ↔ Set (Python)
// Operation	Python set	Dart Set
// Create	s = {1, 2, 3}	var s = {1, 2, 3};
// Create empty	s = set()	var s = <int>{};
// Add element	s.add(4)	s.add(4)
// Add multiple	s.update([4, 5])	s.addAll([4, 5])
// Remove (error if missing)	s.remove(1)	s.remove(1) (no error, returns bool)
// Remove (no error if missing)	s.discard(1)	s.remove(1) (same — Dart's remove never throws)
// Check membership	1 in s	s.contains(1)
// Number of elements	len(s)	s.length
// Clear all	s.clear()	s.clear()
// Union	s1 | s2 or s1.union(s2)	s1.union(s2)
// Intersection	s1 & s2 or s1.intersection(s2)	s1.intersection(s2)
// Difference	s1 - s2 or s1.difference(s2)	s1.difference(s2)
// Is subset	s1 <= s2 or s1.issubset(s2)	s1.containsAll(s2) (reverse direction — checks s2 elements in s1)
// Empty check	not s or len(s) == 0	s.isEmpty
