import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:e_commerce_app/core/init/language/locale_keys.dart';
import 'package:e_commerce_app/product/enums/view_state.dart';
import 'package:e_commerce_app/screens/notification/viewmodel/notification_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/component/notification_card.dart';
import '../../../product/component/response_error.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationViewmodel(),
      builder: (context, child) {
        final viewmodel = Provider.of<NotificationViewmodel>(context);
        return Scaffold(
          appBar: AppBar(title: Text(LocaleKeys.notifications.tr())),
          body: viewmodel.state == ViewState.idle
              ? Padding(
                  padding: context.paddingLow,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(
                        viewmodel.notificationModel!.length,
                        (index) => NotificationCard(
                          model: viewmodel.notificationModel![index],
                          context: context,
                        ),
                      ),
                    ),
                  ),
                )
              : viewmodel.state == ViewState.busy
                  ? const Center(child: CircularProgressIndicator())
                  : ResoponseError(context: context),
        );
      },
    );
  }
}
