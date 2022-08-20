import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/product/auto_route/app_router.dart';
import 'package:e_commerce_app/product/enums/pages_enum.dart';
import 'package:e_commerce_app/product/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/bottom_navigation_viewmodel.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavigationViewmodel(),
      builder: (context, child) {
        final viewmodel = Provider.of<BottomNavigationViewmodel>(context);
        return AutoTabsRouter.tabBar(
          routes: const [
            HomeRoute(),
            CartsRoute(),
            OrdersRoute(),
            ProfileRoute(),
          ],
          builder: (context, child, tabController) {
            return Scaffold(
              body: viewmodel.state == ViewState.idle
                  ? child
                  : const Center(child: CircularProgressIndicator()),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: context.tabsRouter.activeIndex,
                onTap: context.tabsRouter.setActiveIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.home_outlined),
                      label: PagesEnum.home.pageName),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.shopping_cart_outlined),
                      label: PagesEnum.carts.pageName),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.shopping_bag_outlined),
                      label: PagesEnum.orders.pageName),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.person_outline),
                      label: PagesEnum.profile.pageName),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
