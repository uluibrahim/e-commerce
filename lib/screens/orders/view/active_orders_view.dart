import 'package:e_commerce_app/core/init/language/locale_keys.dart';
import 'package:e_commerce_app/screens/carts/model/carts_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../product/component/order_product_card.dart';
import '../../../product/enums/active_or_completed.dart';

class ActiveOrCompletedOrdersView extends StatelessWidget {
  final ActiveOrCompleted activeOrCompleted;
  final List<CartProduct> cartProductList;
  final List<String?> imagesList;
  const ActiveOrCompletedOrdersView({
    Key? key,
    required this.activeOrCompleted,
    required this.cartProductList,
    required this.imagesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartProductList.length,
      itemBuilder: (context, index) {
        return OrderProductCard(
          context: context,
          product: cartProductList[index],
          imageUrl: imagesList[index] ?? "",
          butonText: activeOrCompleted == ActiveOrCompleted.active
              ? LocaleKeys.trackOrder.tr()
              : LocaleKeys.buyAgain.tr(),
          onTap: () {},
          text: activeOrCompleted == ActiveOrCompleted.active
              ? LocaleKeys.inDelivery.tr()
              : LocaleKeys.completed.tr(),
        );
      },
    );
  }
}
