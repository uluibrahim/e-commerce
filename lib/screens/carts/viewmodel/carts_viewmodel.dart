import 'dart:async';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/locator.dart';
import 'package:e_commerce_app/product/enums/view_state.dart';
import 'package:e_commerce_app/screens/carts/service/carts_service.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../model/carts_model.dart';

class CartsViewmodel with ChangeNotifier implements CartsService {
  CartsViewmodel() {
    getAllCarts(5);
  }
  ViewState _state = ViewState.busy;
  ViewState get state => _state;
  set state(ViewState state) {
    _state = state;
    notifyListeners();
  }

  final _service = locator<CartsService>();
  CartsModel? cartsModel;

  @override
  Future getAllCarts(int userId) async {
    try {
      cartsModel = await _service.getAllCarts(userId);
      await fillProductsImages();
      totalPrice = cartsModel!.carts!.first.total;
      state = ViewState.idle;
    } on DioError catch (e) {
      e.error;
      state = ViewState.error;
    }
  }

  List<String?> productsImages = [];

  fillProductsImages() async {
    for (var element in cartsModel!.carts!.first.products!) {
      String? url = await getSingleProduct(element.id!);
      productsImages.add(url);
    }
  }

  @override
  Future<String?> getSingleProduct(int productId) async {
    dynamic body = await _service.getSingleProduct(productId);
    Product product = Product.fromJson(body);
    return product.thumbnailImage;
  }

  dynamic totalPrice = 0;

  increment(int index) {
    cartsModel!.carts!.first.products![index].quantity =
        cartsModel!.carts!.first.products![index].quantity! + 1;
    cartsModel!.carts!.first.products![index].total =
        cartsModel!.carts!.first.products![index].total! +
            cartsModel!.carts!.first.products![index].price!;
    totalPrice += cartsModel!.carts!.first.products![index].price;
    notifyListeners();
  }

  deacrese(int index) {
    if (cartsModel!.carts!.first.products![index].quantity! > 1) {
      cartsModel!.carts!.first.products![index].quantity =
          cartsModel!.carts!.first.products![index].quantity! - 1;
      cartsModel!.carts!.first.products![index].total =
          cartsModel!.carts!.first.products![index].total! -
              cartsModel!.carts!.first.products![index].price!;
      totalPrice -= cartsModel!.carts!.first.products![index].price;
      notifyListeners();
    }
  }

  deleteProduct(int index) {
    totalPrice -= cartsModel!.carts!.first.products![index].total;
    cartsModel!.carts!.first.products!.removeAt(index);
    productsImages.removeAt(index);

    notifyListeners();
  }
}
