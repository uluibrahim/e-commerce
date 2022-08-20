import 'package:e_commerce_app/core/init/language/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileViewmodel with ChangeNotifier {
  final List<IconData> iconDataList = [
    Icons.person,
    Icons.location_on_outlined,
    Icons.notifications_outlined,
    Icons.payment_outlined,
    Icons.security_update_good,
    Icons.lock_outline,
    Icons.help_outline_outlined,
    Icons.people_outline_sharp
  ];

  final List<String> titleList = [
    LocaleKeys.editProfile.tr(),
    LocaleKeys.address.tr(),
    LocaleKeys.notification.tr(),
    LocaleKeys.payment.tr(),
    LocaleKeys.security.tr(),
    LocaleKeys.privacyPolicy.tr(),
    LocaleKeys.helpCenter.tr(),
    LocaleKeys.inviteFriends.tr(),
  ];

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }
}
