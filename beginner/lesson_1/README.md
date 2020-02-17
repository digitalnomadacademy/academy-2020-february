# LESSON 1

## Functions

* Actions that are executed
* Our tools have functions
* Car -> gas, break, clutch

## Syntax
* `;` -> Line/Statement Break
* `//` -> Comment line
* `{}` -> Code Block

## Primitive types

* `String` -> text
* `num int double` -> numbers
* `bool` -> true, false
* `List` -> list of other types
* `Map` -> Dictionary
* `dynamic` -> any type
* `void` -> nothing

## Operands

* `+ - * /` -> regular math
* `|| &&` -> logical or, logical and
    true || true -> true
    true || false -> true
    false || true -> true
    false || false -> false

    true && true -> true
    true && false -> false
    false && true -> false
    false && false -> false

* `== !=` -> equals or not equal
* `=` assign
* `> < >= <=` compare

    1 == 1 -> true
    'matej' == 'Matej' -> false
    3.0 != 3 -> true
    3.0 != 3.0 -> false
    3 >= 3 -> true
    4 < 3 -> false



## Condition

* `if ( condition ) {} else {}` -> logical branching

    if (3 == 4) {
        print('jednako'); // String se pise sa '' ""
    } else {
        print('nije jednako');
    }

## Function details

```
// return type `String`
// name `loveMe`
// parameters `String name`
// body `return 'I love ' + name;`

String loveMe(String name){
  return 'I love ' + name;
}

print(loveMe('Keanu'));
```

## Homework

1. Make sure that you can checkout this repository
 from GIT and that you can run `functions.dart` file.
 `https://github.com/digitalnomadacademy/academy-2020-february.git`
2. Create a textual file where you describe
 one task from day to day life in programming thinking
3. Create function for each return type
4. Check out dart bootcamp
 https://da-bootcamp.firebaseapp.com/?course=start_programming_dart

### Za one koji zele vise
1. Napravite funkcije koje koriste druge funkcije varijable.
2. Napravite funkciju za aparat za kavu koja koristi Map umjesto List