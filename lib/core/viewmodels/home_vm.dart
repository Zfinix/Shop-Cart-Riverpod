import 'package:flutter/material.dart';
import '../models/chair_model.dart';

class HomeViewModel with ChangeNotifier {
  int _currentIndex;
  int get currentIndex => _currentIndex;

  set currentIndex(int val) {
    _currentIndex = val;
    notifyListeners();
  }

  double _totalCost = 0.0;
  double get totalCost => _totalCost;
  set totalCost(num val) {
    _totalCost = val;
    notifyListeners();
  }

  List<ChairModel> _chairList = [
    ChairModel(
      name: 'The coolest chair',
      price: '69.00',
      image: 'chair1',
    ),
    ChairModel(
      name: 'The nicest chair',
      price: '112.00',
      image: 'chair2',
    ),
    ChairModel(
      name: 'Simple chair',
      price: '85.00',
      image: 'chair3',
    )
  ];
  List<ChairModel> get chairList => _chairList;
  set chairList(val) {
    _chairList = val;
    notifyListeners();
  }

  ChairModel get currentChairItem =>
      currentIndex != null ? chairList[currentIndex] : null;
  set currentChairItem(ChairModel val) {
    chairList[currentIndex] = val;
    notifyListeners();
  }

  //Logic to add to total price
  void addNum(ChairModel item) {
    handleSelectedItemClick(item);
    var price = double.parse(currentChairItem.price);

    if (currentChairItem.quantity >= 0) {
      chairList[currentIndex].quantity++;
      totalCost += price;
    }
  }

  //Logic to subtract from total price
  void subNum(ChairModel item) {
    handleSelectedItemClick(item);
    var price = double.parse(currentChairItem.price);

    if (currentChairItem.quantity > 0) {
      chairList[_currentIndex].quantity--;
      totalCost -= price;
    }
  }

  int get totalItems =>
      chairList.map((e) => e.quantity).reduce((k, e) => k + e);

  void handleSelectedItemClick(ChairModel item) {
    var index = chairList.indexWhere((e) {
      return e.id == item.id;
    });
    if (index >= 0) currentIndex = index;
  }

  bool isSelected(ChairModel model) {
    return currentChairItem != null ? currentChairItem?.id == model.id : false;
  }
}
