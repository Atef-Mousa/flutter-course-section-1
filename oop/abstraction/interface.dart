class Flyer {
  void fly() {
    print("Flying generically");
  }
}

class Bird implements Flyer {
  @override
  void fly() {
    print("Bird flapping wings");
  }
}

void main() {
  var b = Bird();
  b.fly(); // Bird flapping wings
}
