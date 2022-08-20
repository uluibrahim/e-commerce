import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:e_commerce_app/core/init/language/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResoponseError extends Center {
  final BuildContext context;
  ResoponseError({Key? key, required this.context})
      : super(
          key: key,
          child: Card(
            child: SizedBox(
                height: context.height * 0.3,
                width: context.width,
                child: Center(child: Text(LocaleKeys.somethingWentWrong.tr()))),
          ),
        );
}
