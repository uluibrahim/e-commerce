import 'package:e_commerce_app/core/constants/app/application_constants.dart';
import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:e_commerce_app/core/init/language/locale_keys.dart';
import 'package:e_commerce_app/product/component/divider_for_sheet.dart';
import 'package:e_commerce_app/product/enums/language_options.dart';
import 'package:e_commerce_app/screens/profile/viewmodel/profile_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectLanguageSheet extends StatefulWidget {
  final ProfileViewmodel viewmodel;
  const SelectLanguageSheet({Key? key, required this.viewmodel})
      : super(key: key);

  @override
  State<SelectLanguageSheet> createState() => _SelectLanguageSheetState();
}

class _SelectLanguageSheetState extends State<SelectLanguageSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xfff3f3f3),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DividerForSheet(context: context),
          Text(
            LocaleKeys.changeLanguage.tr(),
            style: context.textTheme.headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          RadioListTile<int>(
            value: 0,
            groupValue: widget.viewmodel.checkLanguage,
            onChanged: (value) async {
              if (context.locale.countryCode != "US") {
                widget.viewmodel.checkLanguage = value!;
                await context.setLocale(ApplicationConstants.enLocale);
                setState(() {});
              }
            },
            title: Text(LanguageOptions.english.option),
          ),
          RadioListTile<int>(
            value: 1,
            groupValue: widget.viewmodel.checkLanguage,
            onChanged: (value) async {
              if (context.locale.countryCode != "TR") {
                widget.viewmodel.checkLanguage = value!;
                await context.setLocale(ApplicationConstants.trLocale);
                setState(() {});
              }
            },
            title: Text(LanguageOptions.turkce.option),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
