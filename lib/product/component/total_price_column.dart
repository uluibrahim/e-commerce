import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:e_commerce_app/core/init/language/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TotalPrice extends Column {
  final BuildContext context;
  final dynamic price;

  TotalPrice({Key? key, required this.context, required this.price})
      : super(
          key: key,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.totalPrice.tr(),
              style: context.textTheme.bodyMedium?.copyWith(),
            ),
            const SizedBox(height: 5),
            Text(
              "\$ $price",
              style: context.textTheme.headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        );
}
