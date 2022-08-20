// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    BottomNavigationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const BottomNavigationView());
    },
    NotificationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const NotificationView());
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ProductDetailView(key: args.key, product: args.product));
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfileView());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeView());
    },
    CartsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CartsView());
    },
    OrdersRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const OrdersView());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(BottomNavigationRoute.name, path: '/', children: [
          RouteConfig(ProfileRoute.name,
              path: 'profile', parent: BottomNavigationRoute.name),
          RouteConfig(HomeRoute.name,
              path: 'home', parent: BottomNavigationRoute.name),
          RouteConfig(CartsRoute.name,
              path: 'carts', parent: BottomNavigationRoute.name),
          RouteConfig(OrdersRoute.name,
              path: 'orders', parent: BottomNavigationRoute.name)
        ]),
        RouteConfig(NotificationRoute.name, path: 'notification'),
        RouteConfig(ProductDetailRoute.name, path: 'productdetailview')
      ];
}

/// generated route for
/// [BottomNavigationView]
class BottomNavigationRoute extends PageRouteInfo<void> {
  const BottomNavigationRoute({List<PageRouteInfo>? children})
      : super(BottomNavigationRoute.name, path: '/', initialChildren: children);

  static const String name = 'BottomNavigationRoute';
}

/// generated route for
/// [NotificationView]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute()
      : super(NotificationRoute.name, path: 'notification');

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [ProductDetailView]
class ProductDetailRoute extends PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({Key? key, required Product product})
      : super(ProductDetailRoute.name,
            path: 'productdetailview',
            args: ProductDetailRouteArgs(key: key, product: product));

  static const String name = 'ProductDetailRoute';
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({this.key, required this.product});

  final Key? key;

  final Product product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [CartsView]
class CartsRoute extends PageRouteInfo<void> {
  const CartsRoute() : super(CartsRoute.name, path: 'carts');

  static const String name = 'CartsRoute';
}

/// generated route for
/// [OrdersView]
class OrdersRoute extends PageRouteInfo<void> {
  const OrdersRoute() : super(OrdersRoute.name, path: 'orders');

  static const String name = 'OrdersRoute';
}
