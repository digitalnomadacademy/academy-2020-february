void main() {
  var object = Object();
  object.numbers.forEach((String you) {
    print('Hello $you');
  });
}

void creationExample({String name, int number}) {}

class Object {
  List<String> numbers = [
    'one',
    'four',
    'sixteen',
    'four',
    'sixteen',
  ];

//  void callbackExample(Function(String) function) {
//    function(strings[0]);
//    function(strings[1]);
//    function(strings[2]);
//    function(strings[3]);
//    function(strings[4]);
//  }
}
