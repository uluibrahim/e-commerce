import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class StarAndDiscountPercentage extends Row {
  final Product product;
  final BuildContext context;
  StarAndDiscountPercentage(
      {Key? key, required this.product, required this.context})
      : super(
          key: key,
          children: [
            const Icon(Icons.star),
            const SizedBox(width: 5),
            Text(product.rating != null ? product.rating.toString() : ""),
            const Text(" | "),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  " % ${product.discountPercentage}",
                  style: context.textTheme.subtitle1
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        );
}
