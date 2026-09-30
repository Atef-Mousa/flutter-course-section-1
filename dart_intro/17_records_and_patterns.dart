// Lesson 17 — Records, patterns & sealed classes (Dart 3)

// ---------- Records: return multiple values without a class ----------
(String, int) nameAndAge() => ('Ali', 20);

({double lat, double lng}) location() => (lat: 30.04, lng: 31.23);

// ---------- Sealed class: a closed set of subtypes ----------
sealed class Result {}

class Success extends Result {
  final String data;
  Success(this.data);
}

class Failure extends Result {
  final String error;
  Failure(this.error);
}

class Loading extends Result {}

String describe(Result r) {
  // The compiler knows all subtypes -> no default case needed (exhaustive)
  return switch (r) {
    Success(data: var d) => 'Success: $d',
    Failure(:var error) => 'Failure: $error',
    Loading() => 'Loading...',
  };
}

void main() {
  // Positional record
  var person = nameAndAge();
  print('${person.$1} is ${person.$2}');

  // Destructuring
  var (name, age) = nameAndAge();
  print('$name / $age');

  // Named record
  var loc = location();
  print('lat=${loc.lat}, lng=${loc.lng}');
  var (:lat, :lng) = location();
  print('destructured: $lat, $lng');

  // Swap with records
  var a = 1, b = 2;
  (a, b) = (b, a);
  print('a=$a b=$b');

  // Pattern matching on lists and maps
  var numbers = [1, 2, 3, 4];
  if (numbers case [var first, _, ...var rest]) {
    print('first=$first rest=$rest');
  }

  var json = {'user': 'Sara', 'age': 22};
  if (json case {'user': String u, 'age': int ag}) {
    print('json -> $u, $ag');
  }

  // Patterns in switch with guards (when)
  Object value = 42;
  var text = switch (value) {
    int n when n < 0 => 'negative int',
    int n => 'int $n',
    String s => 'string "$s"',
    _ => 'other',
  };
  print(text);

  // Sealed classes
  for (var r in [Success('users loaded'), Failure('no internet'), Loading()]) {
    print(describe(r));
  }
}
