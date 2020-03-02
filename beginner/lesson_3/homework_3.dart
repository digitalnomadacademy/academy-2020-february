void main() {
  ATM atm = ATM(location: 'Gajeva 3');
  print(atm.accountState('Marko'));

  atm.takeMoney('Marko', 120);

  print(atm.accountState('Marko'));
}

class ATM {
  String location;
  Bank bank = Bank();

  Map<Euro, int> money = {
    Euro.one: 100,
    Euro.five: 100,
    Euro.ten: 100,
    Euro.oneHundred: 100,
  };

  ATM({this.location});

  int totalAmountOfMoney() {
    return money[Euro.one] +
        money[Euro.five] * 5 +
        money[Euro.ten] * 10 +
        money[Euro.oneHundred] * 100;
  }

  void addMoneyToATM(Euro cashType, int amount) {
    if (amount > 0) {
      money[cashType] += amount;
    } else {
      print('amount is less than zero');
    }
  }

  void takeMoney(String name, int amount) {
    if (totalAmountOfMoney() >= amount) {
      if (bank.checkState(name) >= amount) {
        bank.deduct(name, amount);
      } else {
        print('$name doesn\'t have that amount of money');
      }
      //homework take money out of ATM as well
    } else {
      print('atm doesn\'t have that amount of money');
    }
  }

  int accountState(String name) => bank.checkState(name);
}

class Bank {
  Map<String, int> deposits = {
    'Marko': 100,
    'Vesna': 500,
    'Jelena': 1992,
    'Kreso': 4000,
    'Giovanni': -5
  };

  /// Returns the deposit state for [name]
  int checkState(String name) => deposits[name];

  bool deduct(String name, int amount) {
    if (checkState(name) >= amount) {
      deposits[name] -= amount;
      return true;
    }
    return false;
  }
}

enum Euro { one, five, ten, oneHundred }
