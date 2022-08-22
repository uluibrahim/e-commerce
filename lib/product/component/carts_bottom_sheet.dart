import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:e_commerce_app/core/init/language/locale_keys.dart';
import 'package:e_commerce_app/product/component/two_elevated_button_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../screens/carts/model/carts_model.dart';
import '../../screens/carts/viewmodel/carts_viewmodel.dart';
import 'divider_for_sheet.dart';
import 'my_product_cart.dart';

class CartsBottomSheet extends StatefulWidget {
  final CartProduct product;
  final int index;
  final CartsViewmodel viewmodel;
  const CartsBottomSheet(
      {Key? key,
      required this.index,
      required this.product,
      required this.viewmodel})
      : super(key: key);

  @override
  State<CartsBottomSheet> createState() => _CartsBottomSheetState();
}

class _CartsBottomSheetState extends State<CartsBottomSheet> {
  late final CartProduct product;
  late final int index;
  late final CartsViewmodel viewmodel;
  @override
  void initState() {
    super.initState();
    product = widget.product;
    index = widget.index;
    viewmodel = widget.viewmodel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xfff3f3f3),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      child: Column(
        children: [
          DividerForSheet(context: context),
          const SizedBox(height: 20),
          Text(
            LocaleKeys.removeFromCart.tr(),
            style: context.textTheme.headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Divider(thickness: 2, indent: 20, endIndent: 20),
          const SizedBox(height: 20),
          MyProductCart(
            imageUrl: viewmodel.productsImages[index] ?? "",
            context: context,
            price: product.price.toString(),
            title: product.title ?? "",
            incrementFunction: () {
              viewmodel.increment(index);
              setState(() {});
            },
            deacreseFunction: () {
              viewmodel.deacrese(index);
              setState(() {});
            },
            quantity: product.quantity!,
          ),
          const SizedBox(height: 20),
          const Divider(thickness: 2, indent: 20, endIndent: 20),
          const SizedBox(height: 20),
          TwoElevatedButtonRow(
            context: context,
            butonText: LocaleKeys.yesRemove.tr(),
            onPres: () {
              viewmodel.deleteProduct(index);
              context.router.pop();
            },
          ),
        ],
      ),
    );
  }
}
