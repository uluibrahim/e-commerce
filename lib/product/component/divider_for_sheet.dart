import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class DividerForSheet extends Divider {
  final BuildContext context;
  DividerForSheet({Key? key, required this.context})
      : super(
          key: key,
          thickness: 5,
          indent: context.width * 0.45,
          endIndent: context.width * 0.45,
        );
}
