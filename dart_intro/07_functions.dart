// Lesson 07 — Functions

// Basic function with return type
int add(int a, int b) {
  return a + b;
}

// Arrow (=>) syntax for one-expression functions
int multiply(int a, int b) => a * b;

// void = returns nothing
void greet(String name) {
  print('Hello, $name');
}

// Optional positional parameters: [ ]
String introduce(String name, [int? age, String country = 'Egypt']) {
  var text = 'I am $name';
  if (age != null) text += ', $age years old';
  return '$text, from $country';
}

// Named parameters: { } — can be required or have defaults
void createUser({required String email, String role = 'student', int? age}) {
  print('User: $email, role: $role, age: ${age ?? 'unknown'}');
}

// Functions are objects: they can be passed as arguments (higher-order)
int applyTwice(int value, int Function(int) operation) {
  return operation(operation(value));
}

// Functions can return other functions (closures)
int Function() makeCounter() {
  var count = 0;
  return () {
    count++;
    return count;
  };
}

// Recursion
int factorial(int n) => n <= 1 ? 1 : n * factorial(n - 1);

// typedef gives a name to a function type
typedef MathOp = int Function(int a, int b);

void main() {
  print(add(2, 3));
  print(multiply(4, 5));
  greet('Omar');

  print(introduce('Mona'));
  print(introduce('Mona', 22));
  print(introduce('Mona', 22, 'Jordan'));

  createUser(email: 'a@b.com');
  createUser(role: 'admin', email: 'x@y.com', age: 30); // order doesn't matter

  // Anonymous function (lambda)
  var square = (int x) => x * x;
  print(applyTwice(3, square)); // (3^2)^2 = 81

  var counter = makeCounter();
  print(counter()); // 1
  print(counter()); // 2 — the closure remembers `count`

  print('5! = ${factorial(5)}');

  MathOp op = add;
  print('MathOp add: ${op(10, 20)}');
  op = multiply;
  print('MathOp multiply: ${op(10, 20)}');
}
