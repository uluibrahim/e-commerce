import 'package:e_commerce_app/product/enums/view_state.dart';
import 'package:flutter/material.dart';

class BottomNavigationViewmodel with ChangeNotifier {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;
  set state(ViewState state) {
    _state = state;
    notifyListeners();
  }
}
