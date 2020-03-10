import 'dart:math';

void main() {
  print('here we go');

  futureIsNow();

  print('here we go again');
}

void futureIsNow() async {
  print('Future is now');

  await Future(() {
    print('future is happening');
  });

  print('Future is yesterday');
}
