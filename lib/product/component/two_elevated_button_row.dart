import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/init/language/locale_keys.dart';
import 'custom_elevated_button.dart';

class TwoElevatedButtonRow extends Padding {
  final BuildContext context;
  final String butonText;
  final VoidCallback onPres;
  TwoElevatedButtonRow({
    Key? key,
    required this.context,
    required this.butonText,
    required this.onPres,
  }) : super(
          key: key,
          padding: context.paddingNormal,
          child: Row(
            children: [
              Expanded(
                flex: 25,
                child: CustomElevatedButton(
                  color: const Color.fromARGB(255, 229, 226, 226),
                  context: context,
                  onTap: () {
                    context.router.pop();
                  },
                  widget: Text(LocaleKeys.cancel.tr(),
                      style: context.textTheme.button),
                ),
              ),
              const Spacer(flex: 2),
              Expanded(
                flex: 25,
                child: CustomElevatedButton(
                  context: context,
                  onTap: onPres,
                  widget: Text(butonText),
                ),
              ),
            ],
          ),
        );
}
