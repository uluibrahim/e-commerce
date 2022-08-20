import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/locator.dart';
import 'package:e_commerce_app/product/enums/view_state.dart';
import 'package:e_commerce_app/screens/home/service/home_service.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class HomeViewmodel with ChangeNotifier implements HomeService {
  final _service = locator<HomeService>();

  HomeViewmodel() {
    getAllProducts();
  }

  ViewState _state = ViewState.busy;
  ViewState get state => _state;
  set state(ViewState state) {
    _state = state;
    notifyListeners();
  }

  final TextEditingController searchController = TextEditingController();

  ProductsModel? allProducts;

  @override
  Future getAllProducts() async {
    try {
      allProducts = await _service.getAllProducts();
      state = ViewState.idle;
    } on DioError catch (e) {
      e.error;
      state = ViewState.error;
    }
  }

  List<Product> fetchProductList = [];
  @override
  Future<List<Product>?> fetchProducts(String key) async {
    ProductsModel products = await _service.fetchProducts(key);

    return products.products;
  }

  CancelableOperation<void>? operation;

  Future<List<Product>> search(String key) async {
    operation?.cancel();
    operation = CancelableOperation.fromFuture(
      Future.delayed(const Duration(milliseconds: 250)),
    );

    fetchProductList = [];
    if (key.length > 2) {
      await operation?.value.then((value) async {
        fetchProductList = await fetchProducts(key) ?? [];
      });
    }

    return fetchProductList;
  }
}
