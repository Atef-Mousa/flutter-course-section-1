class Animal {
  void makeSound() => print('Some generic sound');
}

class Dog extends Animal {
  @override
  void makeSound() => print('Bark');
}

class Cat extends Animal {
  @override
  void makeSound() => print('Meow');
}

void main() {
  List<Animal> animals = [Dog(), Cat(), Animal()];

  for (var animal in animals) {
    animal.makeSound();   // <- THIS line is polymorphism in action
  }
}