void main() {
  String word = 'hello';
  var contains = word.contains('ll');
  print(contains);

  List<int> numbersList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  numbersList.add(11);
  numbersList.removeLast();
  numbersList.removeAt(0);
  print(numbersList);

  numbersList.forEach((number) {
    if (number.isEven) {
      print('$number is even');
    } else {
      print('$number is odd');
    }
  });


  Map<String,int> pairs = {
    'one':1,
    'two':2,
    'three':3,
  };

  print('pairs contains "one"');
  print(pairs.containsKey('one'));
  print('\n');

  pairs.remove('two');
  print(pairs.length);

  pairs['four'] = 4;

}
