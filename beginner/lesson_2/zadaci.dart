void main() {
//  addEntry('niksa', 184);
//  addEntry('lea', 190);
//  deleteEntry('leaA');
//  printAllEntries();

//  print(howHigh('niksa'));
//  print(howHigh('pero'));
//print(allWithHeight(168));
//print(allWithHeight(199));
}

Map<String, int> heightsMap = {
  'alma': 165,
  'tea': 168,
  'lana': 165,
  'lea': 168,
  'leaA': 164,
  'milos': 191,
};

//1.
void addEntry(String name, int height) {
  if (heightsMap.containsKey(name)) {
    print(
        '$name is already added and old $name height is ${heightsMap[name]}\n');
    return; //stops function
  }

  heightsMap[name] = height;
  print('$name is added to collection\n');
}

//2.
int howHigh(String name) {
  if (heightsMap.containsKey(name)) {
    return heightsMap[name]; // height
  } else {
    print('there is no entry for $name in collection\n');
    return -1;
  }
}

//3.
List<String> allWithHeight(int targetHeight) {
  List<String> list = [];

  heightsMap.forEach((name, height) {
    if (height == targetHeight) {
      list.add(name);
    }
  });

  if (list.isEmpty) {
    print('No one is that high: $targetHeight\n');
  }

  return list;
}

//4.
void deleteEntry(String name) {
  if (heightsMap.containsKey(name)) {
    heightsMap.remove(name);
  } else {
    print('there is no entry with $name\n');
  }
}

//5.
void printAllEntries() {
  heightsMap.forEach((name, height) {
    print('$name is $height high\n');
  });
}
