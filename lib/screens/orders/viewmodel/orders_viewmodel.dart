import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../../models/product_model.dart';
import '../../../product/enums/view_state.dart';
import '../../carts/model/carts_model.dart';
import '../../carts/service/carts_service.dart';

class OrdersViewmodel with ChangeNotifier implements CartsService {
  final _service = locator<CartsService>();
  CartsModel? cartsModel;
  OrdersViewmodel() {
    getAllCarts(1);
  }
  ViewState _state = ViewState.busy;
  ViewState get state => _state;
  set state(ViewState state) {
    _state = state;
    notifyListeners();
  }

  @override
  Future getAllCarts(int userId) async {
    try {
      cartsModel = await _service.getAllCarts(userId);
      await _fillProductsImages();
      _divideProductList();
      await _fillProductsImages();
      state = ViewState.idle;
    } on DioError catch (e) {
      e.error;
      state = ViewState.error;
    }
  }

  void _divideProductList() {
    completedProducts = [];
    activeProducts = [];
    for (int i = 0; i < cartsModel!.carts!.first.products!.length; i++) {
      if (i % 2 == 0) {
        completedProducts!.add(cartsModel!.carts!.first.products![i]);
      } else {
        activeProducts!.add(cartsModel!.carts!.first.products![i]);
      }
    }
  }

  List<CartProduct>? completedProducts;
  List<CartProduct>? activeProducts;
  List<String?>? activeImage;
  List<String?>? completedImages;

  Future<void> _fillProductsImages() async {
    completedImages = [];
    activeImage = [];
    for (var i = 0; i < cartsModel!.carts!.first.products!.length; i++) {
      String? url =
          await getSingleProduct(cartsModel!.carts!.first.products![i].id!);
      if (i % 2 == 0) {
        completedImages!.add(url);
      } else {
        activeImage!.add(url);
      }
    }
  }

  @override
  Future<String?> getSingleProduct(int productId) async {
    dynamic body = await _service.getSingleProduct(productId);
    Product product = Product.fromJson(body);
    return product.thumbnailImage;
  }
}
