// Lesson 11 — Inheritance, abstract classes, interfaces

// Abstract class: can't be instantiated, may have abstract methods
abstract class Shape {
  String get name;
  double area(); // abstract method (no body)

  void printInfo() => print('$name area = ${area().toStringAsFixed(2)}');
}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);

  @override
  String get name => 'Circle';

  @override
  double area() => 3.14159 * radius * radius;
}

class Rectangle extends Shape {
  final double width, height;
  Rectangle(this.width, this.height);

  @override
  String get name => 'Rectangle';

  @override
  double area() => width * height;
}

// Inheritance + super
class Square extends Rectangle {
  Square(double side) : super(side, side);

  @override
  String get name => 'Square';

  @override
  void printInfo() {
    print('--- A square is a special rectangle ---');
    super.printInfo(); // call the parent version
  }
}

// Every class is also an implicit interface: use `implements`
class Printable {
  void printMe() {}
}

class Invoice implements Printable {
  final double total;
  Invoice(this.total);

  @override
  void printMe() => print('Invoice total: \$$total');
}

// Dart 3 class modifiers (brief):
// interface class Repo {}  -> can be implemented, not extended outside its file
// base class Base {}       -> can be extended, not implemented outside its file
// final class Locked {}    -> neither, outside its file
// sealed class Result {}   -> see lesson 17

void main() {
  List<Shape> shapes = [Circle(2), Rectangle(3, 4), Square(5)];
  for (var shape in shapes) {
    shape.printInfo(); // polymorphism: each uses its own area()
  }

  Printable p = Invoice(250);
  p.printMe();
}
