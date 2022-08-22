import 'package:e_commerce_app/screens/carts/service/carts_service.dart';
import 'package:e_commerce_app/screens/home/service/home_service.dart';
import 'package:e_commerce_app/screens/notification/service/notification_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();
void setupLocator() {
  locator.registerLazySingleton(() => HomeService());
  locator.registerLazySingleton(() => CartsService());
  locator.registerLazySingleton(() => NotificationService());
}
