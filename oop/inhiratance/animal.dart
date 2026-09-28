class Animal {
  String name;
  Animal(this.name);

  void makeSound() {
    print('$name makes a sound');
  }

  void eat() {
    print('$name is eating');
  }
}

class Dog extends Animal {
  Dog(String name) : super(name);

  void walk_in_four() {
    print('$name is walking on four legs');
  }
}

void main() {
  var d = Dog('Rex');
  d.makeSound();   
  d.eat();         
  d.walk_in_four();  
}