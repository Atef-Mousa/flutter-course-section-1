abstract class Shape {
  double area(); // no body — this is abstract, subclasses MUST implement it
  double perimeter(); // also abstract

  void describe() {
    // this one HAS a body — concrete method, inherited as-is
    print('This shape has area ${area()} and perimeter ${perimeter()}');
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() => 3.14 * radius * radius;

  @override
  double perimeter() => 2 * 3.14 * radius;
}

class Rectangle extends Shape {
  double width, height;
  Rectangle(this.width, this.height);

  @override
  double area() => width * height;

  @override
  double perimeter() => 2 * (width + height);
}

void main() {
  Shape s = Circle(5);
  s.describe(); // uses Circle's area()/perimeter() automatically

  var shapes = [Circle(3), Rectangle(4, 5)];
  for (var shape in shapes) {
    shape.describe(); // polymorphism + abstraction working together here
  }
}
