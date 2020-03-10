void main() {
  var person = PersonWithNamedConstructorShort(name: 'Ime', age: 46);
  person.age = 15;
  person.name = 'Matej';

  print('name is ${person.name} and age is ${person.age}');
}

class Person {
  String name;
  int age;
}

class PersonWithConstructor {
  String name;
  int age;

  PersonWithConstructor(String name, int age) {
    this.name = name;
    this.age = age;
  }
}

class PersonWithConstructorShort {
  String name;
  int age;

  PersonWithConstructorShort(this.name, this.age);
}

class PersonWithNamedConstructorShort {
  String name;
  int age;

  PersonWithNamedConstructorShort({this.name, this.age});
}
