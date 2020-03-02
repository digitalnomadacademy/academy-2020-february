# LESSON 3

## Parameters

* required positional arguments

```
void call(String name, int age)
```

They are defined by position, and you need to pass all arguments, else the
compiler will throw error.

* optional positional arguments

```
void call([String name, int age]){
  print ('name is $name, age is $age');
}
```
You can pass any number of arguments by order.

```
call(); // no arguments
call('Matej'); // only first argument
call('Matej', 32); //both arguments.

```

With optional positional arguments you can add default values
```
void call([String name = 'John', int age = 14]){
  print ('name is $name, age is $age');
}
```
In case you didn't pass the argument when you called the function,
the default value will be used.

You can also combine both


```
void call(String name, [int age]){
  if (age == null) {
    print('name is $name');
  } else {
    print ('name is $name, age is $age');
  }
}

call(); // Compiler will show error here, as name is required
call('Matej'); // only first argument
call('Matej', 32); //both arguments.

```

In this case, the name must be passed, but age is optional

* optional named arguments

```
void call({String name, int age})
...

call(name:'Matej', age:17)
```

They can also be combined
```
void call(String name, {int age}){
```

call('Matej', age:24);


## Classes constructors and types


We already know the basic primitive types like String, int ect...

What if we want to create our own type?

It is easy :)


`class OurType {}`

this code will already create our own type, but what is it useful for?


Lets say that we want to put both name and age inside one Type.

```
class Person {

 String name;
 int age;
}
```

we create new variable of that type by calling in the Name of the class like a function

```
  Person person = Person();
  person.age = 15;
  person.name = 'Matej';

  print('name is ${person.name} and age is ${person.age}');
```

#### _IMPORTANT_
Class names are always with big Capital letter,
 while function names are with small letter

The same way we can pass the arguments to our functions, we can do to our types.
The part of the class that can get that is called *Constructor*

###Constructor
Constructor is written like a function, but with the same name of the class.


check the file classes.dart for examples on constructors.

The one we will use the most in flutter is named argument

```
class Person {
  String name;
  int age;

  Person({this.name, this.age});
}

var person = Person(name:'Matej', age:99);
```

## Final variables

When you write a final variable inside a class,
 you can only initialize it with constructor.

 That kind of variable is called immutable variable.

 ```
 class Person {
   final String name;
   final int age;

   Person({this.name, this.age});
 }

 var person = Person(name:'Matej', age:99);
 ```

 You will be able to read name and age, but you wont be able to change it.
 Has good uses!

## Functions inside classes

Like we have to uppercase and to lowercase functions on the string, or forEach on List and Map,
you can create your own functions inside your class

```
class Person {
  final String name;
  final String surname;
  final int age;

  Person({this.name, this.surname, this.age});

  void printNameAndAge(){
    print('name is ${person.name} and age is ${person.age}');
  }

  String getInitials(){
    return '${name[0]}.${surname[0]}.';
  }
}

var person = Person(name:'Matej', surname:'Simunic', age:99);
```

##Homework

1. Create 10 functions with mixed argument types
They all return void, and they print the values.

Try to make couple of them that will not print null if there is no parameter.

2. Create your own type for any purpose.

3. Create fields and functions that are meaningfull.

ZOKV:

4. Inside one type create fields or functions that are using the same type
5. Create multiple types, where one type is using other types