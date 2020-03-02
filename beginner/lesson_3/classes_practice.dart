void main() {
  Car golf = Car(
      model: 'Golf',
      age: 1996,
      color: Colors.red,
      horsePower: 45,
      isDiesel: false,
      fuel: 10);

  golf.fuel += 10;
  print(golf.model);

  print(golf);

  golf.openOrCloseTheDoor();

  print(golf);
}

class Car {
  final String model;
  Colors color;
  final int age;
  int horsePower;
  bool isDiesel;
  int fuel;

  bool doorOpen = false;

  Car({
    this.model,
    this.age,
    this.color = Colors.grey,
    this.horsePower = 60,
    this.isDiesel = false,
    this.fuel,
  });

  void openOrCloseTheDoor() {
    doorOpen = !doorOpen;
  }

  @override
  String toString() {
    return 'Car{model: $model, color: $color, age: $age, horsePower: $horsePower, isDiesel: $isDiesel, fuel: $fuel, doorOpen: $doorOpen}';
  }
}

enum Colors { red, blue, pink, green, white, black, grey, yellow, orange }
