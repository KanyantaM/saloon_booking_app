import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {
  bool isSwitch = false;
  int index = 0;
  ScrollController hideScrollCtr = ScrollController();
  int currentIndex = 0;
  bool selectPrice = false;
  var valueChoice;

  changeLanguage(newValue) {
    valueChoice = newValue;
    notifyListeners();
  }

  changePrice() {
    selectPrice = !selectPrice;
    notifyListeners();
  }

  changeIsLoading(bool value) {
    isSwitch = value;
    notifyListeners();
  }

  changeBodyIndex(int ind) {
    currentIndex = ind;
    notifyListeners();
  }

  changeIndex(int ind) {
    index = ind;
    notifyListeners();
  }
}
