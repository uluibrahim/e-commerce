import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:e_commerce_app/core/init/language/locale_keys.dart';
import 'package:e_commerce_app/screens/product_detail/viewmodel/product_detail_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app/image/image_constants.dart';
import '../../../models/product_model.dart';
import '../../../product/component/custom_elevated_button.dart';
import '../../../product/component/increment_and_deacrese_button.dart';
import '../../../product/component/start_and_discount_percentage.dart';
import '../../../product/component/total_price_column.dart';

class ProductDetailView extends StatefulWidget {
  final Product product;
  const ProductDetailView({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late final PageController _pageController;
  late Timer _timer;
  int _index = 0;
  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(length: widget.product.images!.length, vsync: this);
    _pageController = PageController();
    _timer =
        Timer.periodic(const Duration(milliseconds: 2500), _timerOperation);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _timerOperation(timer) {
    if (_index == widget.product.images!.length - 1) {
      _index = 0;
    } else {
      _index++;
    }
    _pageController.animateToPage(
      _index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInToLinear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailViewmodel(),
      builder: (context, child) {
        final viewmodel = Provider.of<ProductDetailViewmodel>(context);
        return Scaffold(
          body: Column(children: [
            const SizedBox(height: 32),
            Expanded(
              flex: 45,
              child: _imagesAndBackButton(),
            ),
            Expanded(
              flex: 55,
              child: Container(
                padding: context.pagePadding,
                width: context.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.product.title ?? "",
                          style: context.textTheme.headline4?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(height: 10),
                      StarAndDiscountPercentage(
                        context: context,
                        product: widget.product,
                      ),
                      const Divider(thickness: 2),
                      const SizedBox(height: 20),
                      Text(
                        LocaleKeys.description.tr(),
                        style: context.textTheme.headline6
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        widget.product.description ?? "",
                        style: context.textTheme.subtitle1?.copyWith(),
                      ),
                      const SizedBox(height: 30),
                      _quantityWidget(viewmodel),
                      const SizedBox(height: 10),
                      const Divider(thickness: 2),
                      const SizedBox(height: 20),
                      _addToCartWidget(viewmodel),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }

  Stack _imagesAndBackButton() {
    return Stack(
      children: [
        Container(
            color: const Color(0xfff3f3f3),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: widget.product.images?.length,
                    itemBuilder: (context, index) {
                      return FadeInImage.assetNetwork(
                          placeholder:
                              ImageConstants.instance.toGif("loading_gif"),
                          image: widget.product.images![index]);
                    },
                  ),
                ),
                Padding(
                  padding: context.paddingLow,
                  child: TabPageSelector(
                    borderStyle: BorderStyle.none,
                    selectedColor: const Color(0xff212121),
                    color: const Color(0xffe0dfe0),
                    controller: _tabController,
                  ),
                )
              ],
            )),
        IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff7a7a7b),
          ),
        ),
      ],
    );
  }

  _onPageChanged(int value) {
    _index = value;
    _tabController.animateTo(value);
  }

  _addToCartWidget(ProductDetailViewmodel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TotalPrice(context: context, price: widget.product.price),
        CustomElevatedButton(
          context: context,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.shopping_basket),
              Text(LocaleKeys.addToCart.tr()),
            ],
          ),
          onTap: () {
            viewmodel.addToCart();
          },
        ),
      ],
    );
  }

  Row _quantityWidget(ProductDetailViewmodel viewmodel) {
    return Row(
      children: [
        Text(
          LocaleKeys.quantity.tr(),
          style: context.textTheme.headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 20),
        IncrementAndDeacreseButton(
          incrementFunction: () {
            viewmodel.incrementProductQuantity;
          },
          deacreseFunction: () {
            viewmodel.decreaseProductQuantity;
          },
          count: viewmodel.producQuantity,
        ),
      ],
    );
  }
}
