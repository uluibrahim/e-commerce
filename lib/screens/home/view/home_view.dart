import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:e_commerce_app/core/init/language/locale_keys.dart';
import 'package:e_commerce_app/product/auto_route/app_router.dart';
import 'package:e_commerce_app/product/enums/view_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';
import '../../../product/component/product_card.dart';
import '../../../product/component/response_error.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewmodel(),
      builder: (context, child) {
        final homeViewmodel = Provider.of<HomeViewmodel>(context);
        return SafeArea(
          child: Scaffold(
              body: homeViewmodel.state == ViewState.idle
                  ? Padding(
                      padding: context.pagePaddingTopLeftRigth,
                      child: Column(
                        children: [
                          _userAndNotification(),
                          _searchTextField(homeViewmodel),
                          const SizedBox(height: 10),
                          Expanded(child: _productList(homeViewmodel))
                        ],
                      ),
                    )
                  : homeViewmodel.state == ViewState.error
                      ? ResoponseError(context: context)
                      : const Center(child: CircularProgressIndicator())),
        );
      },
    );
  }

  GridView _productList(HomeViewmodel homeViewmodel) {
    return GridView.builder(
      itemCount: homeViewmodel.allProducts?.products?.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: context.width * 0.5,
        mainAxisExtent: 300,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          context: context,
          product: homeViewmodel.allProducts!.products![index],
        );
      },
    );
  }

  ListTile _userAndNotification() {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const CircleAvatar(
        backgroundImage: NetworkImage("https://picsum.photos/200/300"),
      ),
      title: const Text("Andrew Ainsley"),
      subtitle: const Text("Good morning "),
      trailing: IconButton(
        onPressed: () {
          context.router.navigate(const NotificationRoute());
        },
        icon: const Icon(Icons.notifications_outlined),
      ),
    );
  }

  Container _searchTextField(HomeViewmodel homeViewmodel) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffe7e7e7),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: RawAutocomplete<Product>(
        textEditingController: homeViewmodel.searchController,
        focusNode: _focusNode,
        optionsViewBuilder: (context, onSelected, options) {
          return Material(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: homeViewmodel.fetchProductList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        _focusNode.unfocus();
                        context.router.navigate(ProductDetailRoute(
                            product: homeViewmodel.fetchProductList[index]));
                        homeViewmodel.searchController.clear();
                        homeViewmodel.fetchProductList = [];
                      },
                      leading: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.network(homeViewmodel
                                  .fetchProductList[index].thumbnailImage ??
                              "")),
                      title: Text(homeViewmodel.fetchProductList[index].title
                          .toString()),
                      subtitle: Text(
                          homeViewmodel.fetchProductList[index].brand ?? ""),
                    );
                  }),
            ),
          );
        },
        optionsBuilder: (textEditingValue) async {
          return await homeViewmodel.search(textEditingValue.text);
        },
        fieldViewBuilder:
            (context, textEditingController, focusNode, onFieldSubmitted) {
          return TextFormField(
            focusNode: focusNode,
            controller: textEditingController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: LocaleKeys.search.tr(),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
          );
        },
      ),
    );
  }
}
