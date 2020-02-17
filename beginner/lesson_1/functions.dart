void main() {
//  print(loveMe('Keanu'));
//  print(sum(1,2));
//  printAllCaps('all lowercase letters');
  printCoffeeList();
  print(giveCoffeeWithLists(2));

//  print(giveCoffee(0));
}

String loveMe(String name) {
  String text = 'I love ' + name;
  return text;
}

int sum(int a, int b) {
  int sum = a + b;
  return sum;
}

void printAllCaps(String text) {
  print(text.toUpperCase());
}

String giveCoffee(int coffeeIndex) {
  if (coffeeIndex == 0) {
    return 'espresso';
  } else if (coffeeIndex == 1) {
    // chain if else
    return 'ice coffee';
  } else {
    return 'no coffee with index $coffeeIndex'; //
  }

  print('something'); // dead code
}

List<String> drinks = ['espresso', 'ice coffee', 'hot chocolate'];

String giveCoffeeWithLists(int coffee) {
  int coffeeIndex = coffee - 1;

  if (coffeeIndex < 0) {
    var error = 'You have to enter coffee greater than zero';
    return error;
  } else if (coffeeIndex >= drinks.length) {
    return 'There are only ${drinks.length} coffees';
  } else {
    return '\nHere you go. You ordered ${drinks[coffeeIndex]}';
  }
}

void printCoffeeList() {
  // run function for each element of the List
  drinks.forEach((String drink) {
//    get index for drink
    int index = drinks.indexOf(drink) + 1;
    print('$index: $drink');
  });

  print('\nThose are all coffees I have');
}
