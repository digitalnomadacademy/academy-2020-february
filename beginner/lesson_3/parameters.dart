void main() {
//  printPerson('John','Lowenbrau');
  printPerson(name: 'John', surname: 'Kralj', middleName: 'leba', age: 18);
}

void printPerson({String name, String surname, String middleName, int age}) {
  print('$name $surname $middleName $age');
}


