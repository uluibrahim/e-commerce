import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:e_commerce_app/core/init/language/locale_keys.dart';
import 'package:e_commerce_app/screens/profile/viewmodel/profile_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/component/divider_for_sheet.dart';
import '../../../product/component/sort_icon_appbar.dart';
import '../../../product/component/two_elevated_button_row.dart';
import '../widget/select_language_sheet.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewmodel(),
      builder: (context, child) {
        final viewmodel = Provider.of<ProfileViewmodel>(context);
        return Scaffold(
          appBar: SortIconAppbar(
            context: context,
            titleText: LocaleKeys.profile.tr(),
            actionIcon: Icons.account_circle_rounded,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Expanded(
                flex: 30,
                child: _userInfo(context),
              ),
              Expanded(
                flex: 70,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _profileCarts(),
                      Column(
                        children: [
                          _languageOptions(context, viewmodel),
                          _themeMode(viewmodel),
                          _logOut(context),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ListTile _logOut(BuildContext context) {
    return ListTile(
      onTap: () {
        _showSheetLogOut(context);
      },
      leading: const Icon(Icons.logout, color: Colors.red),
      title: Text(
        LocaleKeys.logOut.tr(),
        style: context.textTheme.titleMedium?.copyWith(color: Colors.red),
      ),
    );
  }

  ListTile _themeMode(ProfileViewmodel viewmodel) {
    return ListTile(
      leading: const Icon(Icons.remove_red_eye_outlined),
      title: Text(LocaleKeys.darkMode.tr()),
      trailing: CupertinoSwitch(
        activeColor: Colors.black,
        value: viewmodel.darkMode,
        onChanged: (value) {
          viewmodel.darkMode = value;
        },
      ),
    );
  }

  ListTile _languageOptions(BuildContext context, ProfileViewmodel viewmodel) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(LocaleKeys.language.tr()),
          Text(LocaleKeys.selectedLanguage.tr()),
        ],
      ),
      trailing: IconButton(
        onPressed: () async {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            context: context,
            builder: (context) {
              return SelectLanguageSheet(viewmodel: viewmodel);
            },
          );
        },
        icon: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }

  Column _userInfo(BuildContext context) {
    return Column(
      children: [
        Flexible(child: _circularPhotoAndEditIcon),
        const SizedBox(height: 20),
        Text("Andrew Ainsley",
            style: context.textTheme.headline6
                ?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text("+9 0555 555 11 11 ",
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        const Divider(thickness: 2, indent: 20, endIndent: 20),
      ],
    );
  }

  Column _profileCarts() {
    return Column(children: [
      ListTile(
        leading: const Icon(Icons.person),
        title: Text(
          LocaleKeys.editProfile.tr(),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.location_on_outlined),
        title: Text(
          LocaleKeys.address.tr(),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.notifications_outlined),
        title: Text(
          LocaleKeys.notification.tr(),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.payment_outlined),
        title: Text(
          LocaleKeys.payment.tr(),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.security_update_good),
        title: Text(
          LocaleKeys.security.tr(),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.lock_outline),
        title: Text(
          LocaleKeys.privacyPolicy.tr(),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.help_outline_outlined),
        title: Text(
          LocaleKeys.helpCenter.tr(),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.people_outline_sharp),
        title: Text(
          LocaleKeys.inviteFriends.tr(),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
    ]);
  }

  Stack get _circularPhotoAndEditIcon {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage("https://picsum.photos/200/300"),
        ),
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: const Icon(
            Icons.edit_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  _showSheetLogOut(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  DividerForSheet(context: context),
                  const SizedBox(height: 20),
                  Text(
                    LocaleKeys.logOut.tr(),
                    style: context.textTheme.headline6
                        ?.copyWith(color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  const Divider(thickness: 2, indent: 20, endIndent: 20),
                  const SizedBox(height: 20),
                  Text(
                    LocaleKeys.areYouSureYouWantToLogOut.tr(),
                    style: context.textTheme.headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TwoElevatedButtonRow(
                    context: context,
                    onPres: () {},
                    butonText: LocaleKeys.yesLogOut.tr(),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
