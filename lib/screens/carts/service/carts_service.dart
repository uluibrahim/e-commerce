import 'package:e_commerce_app/core/init/network/network_manager.dart';
import 'package:e_commerce_app/product/enums/service_paths.dart';
import 'package:e_commerce_app/screens/carts/service/i_carts_service.dart';

import '../model/carts_model.dart';

class CartsService extends ICartsService {
  @override
  Future getAllCarts(int userId) async {
    return NetworkManager.instance?.dioGet(
      "${ServicePaths.getAllCarts.path}$userId",
      model: CartsModel(),
    );
  }

  @override
  Future getSingleProduct(int productId) async {
    return NetworkManager.instance?.dioGet(
      "${ServicePaths.getSingleProduct.path}$productId",
    );
  }
}
