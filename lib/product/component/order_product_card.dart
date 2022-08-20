import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:e_commerce_app/core/init/language/locale_keys.dart';
import 'package:e_commerce_app/product/component/product_image_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../screens/carts/model/carts_model.dart';
import 'custom_elevated_button.dart';
import 'grey_container_with_text.dart';

class OrderProductCard extends Container {
  final BuildContext context;
  final String imageUrl;
  final String butonText;
  final CartProduct product;
  final String text;
  final VoidCallback onTap;

  OrderProductCard({
    Key? key,
    required this.context,
    required this.imageUrl,
    required this.butonText,
    required this.product,
    required this.text,
    required this.onTap,
  }) : super(
          key: key,
          margin: context.paddingLow,
          padding: context.paddingLow,
          width: context.width * 0.8,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              Expanded(
                flex: 25,
                child: SizedBox(
                  height: 100,
                  child: ProductImageCard(imageUrl: imageUrl),
                ),
              ),
              Expanded(
                flex: 65,
                child: Container(
                  padding: context.paddingLowHorizontal,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title ?? "", style: _boldStyleText(context)),
                      const SizedBox(height: 5),
                      Text("${LocaleKeys.quantity.tr()} = ${product.quantity}"),
                      const SizedBox(height: 5),
                      GreyContainerWithText(text: text),
                      Row(
                        children: [
                          Expanded(
                              flex: 40,
                              child: Text("\$  ${product.price}",
                                  style: _boldStyleText(context))),
                          Expanded(
                            flex: 60,
                            child: CustomElevatedButton(
                              minumumSize: false,
                              context: context,
                              onTap: onTap,
                              widget: Text(butonText),
                            ),
                          ),
                        ],
                      )
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
