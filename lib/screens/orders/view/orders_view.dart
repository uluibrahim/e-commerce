import 'package:e_commerce_app/core/init/language/locale_keys.dart';
import 'package:e_commerce_app/product/enums/active_or_completed.dart';
import 'package:e_commerce_app/product/enums/view_state.dart';
import 'package:e_commerce_app/screens/orders/view/active_orders_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/component/sort_icon_appbar.dart';
import '../viewmodel/orders_viewmodel.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrdersViewmodel(),
      builder: (context, child) {
        final viewmodel = Provider.of<OrdersViewmodel>(context);
        return Scaffold(
          appBar: SortIconAppbar(
            context: context,
            titleText: LocaleKeys.myOrders.tr(),
            actionIcon: Icons.search,
            tabBar: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: LocaleKeys.active.tr()),
                Tab(text: LocaleKeys.completed.tr()),
              ],
            ),
          ),
          body: viewmodel.state == ViewState.idle
              ? TabBarView(
                  controller: _tabController,
                  children: [
                    ActiveOrCompletedOrdersView(
                      activeOrCompleted: ActiveOrCompleted.active,
                      imagesList: viewmodel.activeImage!,
                      cartProductList: viewmodel.activeProducts!,
                    ),
                    ActiveOrCompletedOrdersView(
                      activeOrCompleted: ActiveOrCompleted.completed,
                      imagesList: viewmodel.completedImages!,
                      cartProductList: viewmodel.completedProducts!,
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
