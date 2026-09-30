// Lesson 12 — Mixins & extension methods

// A mixin adds reusable behavior to many classes without inheritance
mixin Swimmer {
  void swim() => print('$runtimeType is swimming');
}

mixin Flyer {
  void fly() => print('$runtimeType is flying');
}

class Animal {
  final String name;
  Animal(this.name);
}

// `on` restricts a mixin to subclasses of a type
mixin Walker on Animal {
  void walk() => print('$name is walking');
}

class Duck extends Animal with Swimmer, Flyer, Walker {
  Duck(super.name);
}

class Fish extends Animal with Swimmer {
  Fish(super.name);
}

// Extension methods: add methods to existing types (even String / int)
extension StringTools on String {
  String get capitalized =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  bool get isPalindrome {
    var clean = toLowerCase().replaceAll(' ', '');
    return clean == clean.split('').reversed.join();
  }
}

extension IntTools on int {
  bool get isPrime {
    if (this < 2) return false;
    for (var i = 2; i * i <= this; i++) {
      if (this % i == 0) return false;
    }
    return true;
  }

  Duration get seconds => Duration(seconds: this);
}

void main() {
  var duck = Duck('Donald');
  duck.swim();
  duck.fly();
  duck.walk();

  Fish('Nemo').swim();

  print('flutter'.capitalized);
  print('Never odd or even'.isPalindrome);
  print('7 is prime: ${7.isPrime}, 9 is prime: ${9.isPrime}');
  print(5.seconds);
}
