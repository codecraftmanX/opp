import 'dart:io';
import 'dart:convert';

// Interface
abstract class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void speak();
}

// Class that implements the interface
class Dog implements Animal {
  String name;
  int age;

  Dog(this.name, this.age);

  @override
  void speak() {
    print('$name the dog says: Woof!');
  }
}

// Class that overrides an inherited method
class Cat extends Dog {
  Cat(String name, int age) : super(name, age);

  @override
  void speak() {
    print('$name the cat says: Meow!');
  }
}

// Method that demonstrates the use of a loop
void main() async {
  // Load data from a file
  final file = File('animals.json');
  final jsonString = await file.readAsString();
  final jsonData = jsonDecode(jsonString);

  // Create instances of the classes
  final dog = Dog(jsonData['dog']['name'], jsonData['dog']['age']);
  final cat = Cat(jsonData['cat']['name'], jsonData['cat']['age']);

  // Use a loop to call the speak method for each animal
  for (final animal in [dog, cat]) {
    animal.speak();
  }
}