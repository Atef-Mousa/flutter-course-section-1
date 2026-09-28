class Animal {
  void makeSound() {
    print('Some generic animal sound');
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print('Meow');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Bark');
  }
}

void main() {
  Animal x = Cat();     // declared type: Animal, actual runtime object: Cat
  x.makeSound();         // prints "Meow" — NOT "Some generic animal sound"

  Animal y = Dog();
  y.makeSound();         // prints "Bark"

  print(x.runtimeType);  // Cat  <- confirms what it really is underneath
}