import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:e_commerce_app/product/component/product_image_card.dart';
import 'package:flutter/material.dart';

import 'increment_and_deacrese_button.dart';

class MyProductCart extends Container {
  final BuildContext context;
  final bool? showDeletIcon;
  final String title;
  final String price;
  final VoidCallback? removePressed;
  final VoidCallback incrementFunction;
  final VoidCallback deacreseFunction;
  final int quantity;
  final String imageUrl;
  MyProductCart({
    Key? key,
    required this.context,
    this.showDeletIcon,
    required this.price,
    required this.title,
    required this.deacreseFunction,
    required this.incrementFunction,
    required this.quantity,
    this.removePressed,
    required this.imageUrl,
  }) : super(
          key: key,
          margin: context.paddingLow,
          padding: context.paddingLow,
          width: context.width * 0.8,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              Expanded(
                flex: 25,
                child: ProductImageCard(imageUrl: imageUrl)
              ),
              Expanded(
                flex: 65,
                child: Container(
                  padding: context.paddingLowHorizontal,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(title, style: _boldStyleText(context)),
                          ),
                          showDeletIcon != null && showDeletIcon
                              ? IconButton(
                                  onPressed: removePressed,
                                  icon: const Icon(Icons.delete_outline),
                                )
                              : const SizedBox()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$ $price", style: _boldStyleText(context)),
                          IncrementAndDeacreseButton(
                            incrementFunction: incrementFunction,
                            deacreseFunction: deacreseFunction,
                            count: quantity,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
}

TextStyle? _boldStyleText(BuildContext context) =>
    context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold);
