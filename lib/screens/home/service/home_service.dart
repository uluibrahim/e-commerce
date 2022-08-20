import 'package:e_commerce_app/core/init/network/network_manager.dart';
import 'package:e_commerce_app/screens/home/service/i_home_service.dart';

import '../../../models/product_model.dart';
import '../../../product/enums/service_paths.dart';

class HomeService extends IHomeService {
  @override
  Future getAllProducts() async {
    return NetworkManager.instance?.dioGet(
      ServicePaths.allproducts.path,
      model: ProductsModel(),
    );
  }

  @override
  Future fetchProducts(String key) async {
    return NetworkManager.instance?.dioGet(
      ServicePaths.searchproduct.path + key,
      model: ProductsModel(),
    );
  }
}
