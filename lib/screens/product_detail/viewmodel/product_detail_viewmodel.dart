import 'package:flutter/material.dart';

class ProductDetailViewmodel with ChangeNotifier {
  int _producQuantity = 1;
  int get producQuantity => _producQuantity;

  void get incrementProductQuantity {
    _producQuantity++;
    notifyListeners();
  }

  void get decreaseProductQuantity {
    if (_producQuantity > 1) {
      _producQuantity--;
      notifyListeners();
    }
  }

  addToCart() {}
}
