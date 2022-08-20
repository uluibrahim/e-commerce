import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SortIconAppbar extends AppBar {
  final BuildContext context;
  final String titleText;
  final IconData actionIcon;
  final PreferredSizeWidget? tabBar;
  SortIconAppbar({
    Key? key,
    required this.context,
    required this.titleText,
    required this.actionIcon,
    this.tabBar,
  }) : super(
          key: key,
          toolbarHeight: 40,
          centerTitle: false,
          leading: const Icon(Icons.sort),
          title: Text(
            titleText,
            style: context.textTheme.headline5
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: [
            Icon(actionIcon),
            const SizedBox(width: 20),
          ],
          bottom: tabBar,
        );
}
