import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/screens/orders/view/orders_view.dart';

import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../screens/bottom_navigation/view/bottom_navigation_view.dart';

import '../../screens/carts/view/carts_view.dart';
import '../../screens/home/view/home_view.dart';
import '../../screens/notification/view/notification_view.dart';
import '../../screens/product_detail/view/product_detail_view.dart';
import '../../screens/profile/view/profile_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: BottomNavigationView,
      children: [
        AutoRoute(page: ProfileView, path: 'profile'),
        AutoRoute(page: HomeView, path: 'home'),
        AutoRoute(page: CartsView, path: 'carts'),
        AutoRoute(page: OrdersView, path: 'orders'),
      ],
    ),
    AutoRoute(page: NotificationView, path: "notification"),
    AutoRoute(page: ProductDetailView, path: "productdetailview"),
  ],
)
class AppRouter extends _$AppRouter {}
