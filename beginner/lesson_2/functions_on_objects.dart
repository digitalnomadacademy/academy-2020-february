void main() {
  String word = 'hello world';
  List<String> words = word.split(" ");
  print(words.join(" "));

  List<int> numbersList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  numbersList.add(11);
  numbersList.removeLast();
  numbersList.removeAt(0);
  print(numbersList);
//
  numbersList.forEach((number) {
    if (number.isEven) {
      print('$number is even');
    } else {
      print('$number is odd');
    }
  });


  Map<String, int> pairs = {
    'One': 1,
    'two': 2,
    'three': 3,
    'white':3,
    'black':3,

  };


  print('pairs contains "one"');
  print(pairs.containsKey('one'));
  print('\n');

  print(pairs.length);
  pairs.remove('two');
  print(pairs.length);


  if (pairs.containsKey('one')) {
    print('one is already added');
  } else {
    pairs['one'] = 4;
  }
  print(pairs['one']);
}
