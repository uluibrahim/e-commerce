import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:e_commerce_app/product/component/start_and_discount_percentage.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../auto_route/app_router.dart';

class ProductCard extends GestureDetector {
  final Product product;
  final BuildContext context;

  ProductCard({Key? key, required this.product, required this.context})
      : super(
          key: key,
          onTap: () {
            context.router.navigate(ProductDetailRoute(product: product));
          },
          child: Container(
            padding: context.paddingLow,
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: const Color(0xfff5f5f5),
                      image: DecorationImage(
                        image: NetworkImage(product.thumbnailImage!),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? "",
                      style: context.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    StarAndDiscountPercentage(
                      context: context,
                      product: product,
                    ),
                    Text(
                      "\$ ${product.price}",
                      style: context.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
}
