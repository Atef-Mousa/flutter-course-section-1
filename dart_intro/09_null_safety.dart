// Lesson 09 — Sound null safety

class Profile {
  String name; // non-nullable: must always have a value
  String? bio; // nullable: may be null
  late String avatarUrl; // will be set later, before first use

  Profile(this.name);
}

int? findIndex(List<String> items, String target) {
  var i = items.indexOf(target);
  return i == -1 ? null : i;
}

void main() {
  // Non-nullable variables can't hold null
  String city = 'Cairo';
  // city = null; // Compile error
  print(city);

  // Nullable variables use ?
  String? middleName;
  print('middleName: $middleName'); // null

  // 1) Check for null -> Dart promotes the type automatically
  if (middleName != null) {
    print(middleName.length); // safe here
  }

  // 2) ?. null-aware access
  print(middleName?.toUpperCase()); // null, no crash

  // 3) ?? default value
  print(middleName ?? 'N/A');

  // 4) ??= assign if null
  middleName ??= 'Mohamed';
  print(middleName);

  // 5) ! null assertion — "trust me, it's not null" (crashes if wrong!)
  String? loaded = int.tryParse('7') != null ? 'data' : null;
  print(loaded!.length);

  var index = findIndex(['a', 'b', 'c'], 'b');
  print('index: ${index ?? 'not found'}');

  // late fields
  var p = Profile('Ali');
  p.avatarUrl = 'https://example.com/ali.png';
  print('${p.name} ${p.bio ?? '(no bio)'} ${p.avatarUrl}');
}
