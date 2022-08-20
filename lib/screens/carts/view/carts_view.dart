import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:e_commerce_app/core/init/language/locale_keys.dart';
import 'package:e_commerce_app/product/enums/view_state.dart';
import 'package:e_commerce_app/screens/carts/viewmodel/carts_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/component/carts_bottom_sheet.dart';
import '../../../product/component/custom_elevated_button.dart';
import '../../../product/component/my_product_cart.dart';
import '../../../product/component/sort_icon_appbar.dart';
import '../../../product/component/total_price_column.dart';
import '../model/carts_model.dart';

class CartsView extends StatefulWidget {
  const CartsView({Key? key}) : super(key: key);

  @override
  State<CartsView> createState() => _CartsViewState();
}

class _CartsViewState extends State<CartsView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartsViewmodel(),
      builder: (context, child) {
        final viewmodel = Provider.of<CartsViewmodel>(context);
        return Scaffold(
          backgroundColor: const Color(0xfff3f3f3),
          appBar: SortIconAppbar(
            context: context,
            titleText: LocaleKeys.myCart.tr(),
            actionIcon: Icons.search,
          ),
          body: viewmodel.state == ViewState.idle
              ? Column(
                  children: [
                    Expanded(child: _listProducts(viewmodel)),
                    _totalPriceAndCheckout(viewmodel),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Container _totalPriceAndCheckout(CartsViewmodel viewmodel) {
    return Container(
      width: context.width,
      height: 100,
      padding: context.paddingNormal,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TotalPrice(context: context, price: viewmodel.totalPrice),
          CustomElevatedButton(
            context: context,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(LocaleKeys.checkout.tr()),
                const Icon(Icons.arrow_forward),
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _listProducts(CartsViewmodel viewmodel) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: ListView.builder(
        itemCount: viewmodel.cartsModel!.carts?.first.products?.length,
        itemBuilder: (context, index) {
          return MyProductCart(
              imageUrl: viewmodel.productsImages[index] ?? "",
              context: context,
              price: viewmodel.cartsModel!.carts!.first.products![index].price
                  .toString(),
              title:
                  viewmodel.cartsModel!.carts?.first.products?[index].title ??
                      "",
              incrementFunction: () {
                viewmodel.increment(index);
              },
              deacreseFunction: () {
                viewmodel.deacrese(index);
              },
              quantity:
                  viewmodel.cartsModel!.carts!.first.products![index].quantity!,
              showDeletIcon: true,
              removePressed: () {
                _showBottomSheatForRemove(
                  viewmodel.cartsModel!.carts!.first.products![index],
                  index,
                  viewmodel,
                );
              });
        },
      ),
    );
  }

  _showBottomSheatForRemove(
      CartProduct product, int index, CartsViewmodel viewmodel) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      context: context,
      builder: (context) {
        return CartsBottomSheet(
          index: index,
          product: product,
          viewmodel: viewmodel,
        );
      },
    );
  }
}
