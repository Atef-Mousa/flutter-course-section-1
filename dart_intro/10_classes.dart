// Lesson 10 — Classes & objects

class Student {
  // Fields
  final String name;
  int _grade; // _ = private to this library (file)
  static int count = 0; // belongs to the class, not objects

  // Generative constructor with initializing formals
  Student(this.name, this._grade) {
    count++;
  }

  // Named constructor (redirects to the main one)
  Student.newcomer(String name) : this(name, 0);

  // Factory constructor (can return an existing object or a subtype)
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(map['name'] as String, map['grade'] as int);
  }

  // Getter & setter
  int get grade => _grade;
  set grade(int value) {
    if (value < 0 || value > 100) {
      print('Invalid grade: $value');
      return;
    }
    _grade = value;
  }

  bool get passed => _grade >= 50;

  // Method
  void describe() => print('$name has grade $_grade (passed: $passed)');

  // Override toString for nice printing
  @override
  String toString() => 'Student($name, $_grade)';
}

// Const constructor: immutable objects that can be compile-time constants
class Point {
  final int x;
  final int y;
  const Point(this.x, this.y);

  // Operator overloading
  Point operator +(Point other) => Point(x + other.x, y + other.y);

  @override
  bool operator ==(Object other) =>
      other is Point && other.x == x && other.y == y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => 'Point($x, $y)';
}

void main() {
  var s1 = Student('Ali', 75);
  var s2 = Student.newcomer('Sara');
  var s3 = Student.fromMap({'name': 'Omar', 'grade': 40});

  s1.describe();
  s2.describe();
  s3.describe();

  s2.grade = 120; // rejected by the setter
  s2.grade = 88;
  print(s2);
  print('Total students: ${Student.count}');

  const p1 = Point(1, 2);
  const p2 = Point(1, 2);
  print(p1 + p2);
  print('p1 == p2: ${p1 == p2}');
  print('identical: ${identical(p1, p2)}'); // true: same const instance
}
