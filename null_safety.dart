// Null safety prevents an error that results from unintentional access of variables set to null.
// The error is called a null dereference error. A null dereference error occurs when you access a property or call a method on an expression
// that evaluates to null. An exception to this rule is when null supports the property or method, like toString() or hashCode. With null safety,
// the Dart compiler detects these potential errors at compile time.

// The problem isn't that manual checking is impossible — it's
//  that manual checking is optional, easy to forget, and unenforceable at scale. Let me show you why that matters.

// String getUserName() {
//   return null;
// }
// void main()
// {

//     String x = getUserName();
//     print(x.length);

// }

String? getUserName() {
  return null;
}

// ============================================================
// Helpers used in the examples below
// ============================================================
class Address {
  String? street;
  String city;
  Address(this.city, {this.street});
}

class User {
  String name; // non-nullable: always has a value
  String? phone; // nullable: may be missing
  Address? address; // nullable object

  User(this.name, {this.phone, this.address});
}

// Nullable return type: "I may not find it"
User? findUser(List<User> users, String name) {
  for (var u in users) {
    if (u.name == name) return u;
  }
  return null;
}

// Nullable parameters & default values
String greet(String name, {String? title}) {
  return title == null ? 'Hello $name' : 'Hello $title $name';
}

void printLength(String? text) {
  // Early return: after this line Dart knows text is NOT null
  if (text == null) {
    print('   no text');
    return;
  }
  print('   length: ${text.length}');
}

void main() {
  // ------------------------------------------------------------
  // 0) Original example
  // ------------------------------------------------------------
  String? x = getUserName();
  if (x != null) {
    print(x.length);
  } else {
    print("0) x is null");
  }
  // print(x.length); // Error: x might be null

  // ------------------------------------------------------------
  // 1) Non-nullable vs nullable
  // ------------------------------------------------------------
  String name = 'Ali';
  // name = null; // Error: String can't be null
  String? nickname; // default value is null
  int? age; // nullable int
  print('1) $name, nickname: $nickname, age: $age');

  // A non-nullable local must be assigned before use
  int count;
  // print(count); // Error: must be assigned before it's used
  count = 5;
  print('1) count: $count');

  // ------------------------------------------------------------
  // 2) Type promotion: after a null check, String? becomes String
  // ------------------------------------------------------------
  String? email = DateTime.now().year > 2000 ? 'ali@mail.com' : null;
  if (email != null) {
    print('2) ${email.toUpperCase()}'); // promoted to String
  }
  if (email is String) {
    print('2) is String too: ${email.length}');
  }

  printLength('Flutter');
  printLength(null);

  // ------------------------------------------------------------
  // 3) ?.  null-aware access
  // ------------------------------------------------------------
  String? city = getUserName(); // returns null
  print('3) ${city?.length}'); // null, no crash
  print('3) ${city?.toUpperCase().trim()}'); // whole chain short-circuits

  // ------------------------------------------------------------
  // 4) ??  default value if null
  // ------------------------------------------------------------
  print('4) ${city ?? 'Unknown city'}');
  int length = city?.length ?? 0; // very common combo
  print('4) length: $length');

  // ------------------------------------------------------------
  // 5) ??=  assign only if null
  // ------------------------------------------------------------
  String? theme = getUserName(); // null
  theme ??= 'dark'; // assigned
  // ignore: dead_code, dead_null_aware_expression
  theme ??= 'light'; // ignored, already has a value
  print('5) theme: $theme');

  // ------------------------------------------------------------
  // 6) !  null assertion operator — use carefully
  // ------------------------------------------------------------
  String? token = findUser([User('Ali')], 'Ali')?.name; // 'Ali'
  print('6) ${token!.length}'); // OK, token is not null

  String? missing;
  try {
    print(missing!.length); // throws at runtime!
  } catch (e) {
    print('6) using ! on null -> ${e.runtimeType}');
  }

  // ------------------------------------------------------------
  // 7) Nested nullable objects
  // ------------------------------------------------------------
  var users = [
    User('Ali', phone: '0100', address: Address('Cairo', street: 'Tahrir')),
    User('Sara'),
  ];

  var ali = findUser(users, 'Ali');
  var sara = findUser(users, 'Sara');
  var omar = findUser(users, 'Omar'); // not found -> null

  print('7) ${ali?.address?.street}'); // Tahrir
  print('7) ${sara?.address?.street ?? 'no street'}'); // no street
  print('7) ${omar?.name ?? 'user not found'}');

  // ------------------------------------------------------------
  // 8) Nullable collections vs collections of nullable items
  // ------------------------------------------------------------
  List<String>? maybeList = getUserName()?.split(''); // the LIST may be null
  List<String?> listWithNulls = ['a', null, 'c']; // ITEMS may be null
  List<String?>? both; // both may be null

  print('8) ${maybeList?.length ?? 0} items');
  print('8) $listWithNulls, $both');

  // Remove nulls: whereType<String>() returns List<String>
  List<String> clean = listWithNulls.whereType<String>().toList();
  print('8) clean: $clean');

  // Null-aware spread
  var all = [...?maybeList, 'x'];
  print('8) spread: $all');

  // Map lookups always return a nullable value
  var ages = {'Ali': 20};
  int? aliAge = ages['Ali'];
  int omarAge = ages['Omar'] ?? 0;
  print('8) Ali: $aliAge, Omar: $omarAge');

  // ------------------------------------------------------------
  // 9) Nullable parameters
  // ------------------------------------------------------------
  print('9) ${greet('Mona')}');
  print('9) ${greet('Mona', title: 'Dr.')}');

  // ------------------------------------------------------------
  // 10) Null-aware cascade ?..
  // ------------------------------------------------------------
  User? maybeUser = findUser(users, 'Sara');
  maybeUser
    ?..phone = '0122'
    ..address = Address('Giza');
  print('10) ${maybeUser?.phone}, ${maybeUser?.address?.city}');

  // ------------------------------------------------------------
  // 11) Fields are NOT promoted if they are public & non-final
  //     -> copy into a local variable first
  // ------------------------------------------------------------
  var u = users.first;
  // if (u.phone != null) print(u.phone.length); // Error: field could change
  final phone = u.phone; // local copy
  if (phone != null) {
    print('11) phone length: ${phone.length}');
  }

  // ------------------------------------------------------------
  // 12) Pattern style (Dart 3): check & bind in one step
  // ------------------------------------------------------------
  if (u.address?.street case final street?) {
    print('12) street is $street');
  }

  // ------------------------------------------------------------
  // Summary
  // ------------------------------------------------------------
  // Type?    -> may be null
  // ?.       -> call only if not null
  // ??       -> default value if null
  // ??=      -> assign if null
  // !        -> "I'm sure it's not null" (crashes if wrong)
  // late     -> see late.dart
}
