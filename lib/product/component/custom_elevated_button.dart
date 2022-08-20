import 'package:e_commerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends ElevatedButton {
  final BuildContext context;
  final VoidCallback onTap;
  final Widget widget;
  final Color? color;
  final bool? minumumSize;
  CustomElevatedButton({
    Key? key,
    required this.context,
    required this.onTap,
    required this.widget,
    this.color,
    this.minumumSize = true,
  }) : super(
          key: key,
          style: const ButtonStyle().copyWith(
            backgroundColor:
                MaterialStateProperty.all(color ?? const Color(0xff101010)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            minimumSize: minumumSize != null && minumumSize
                ? MaterialStateProperty.all(const Size.fromRadius(25))
                : null,
            fixedSize:
                MaterialStateProperty.all(Size.fromWidth(context.width * 0.5)),
          ),
          onPressed: onTap,
          child: widget,
        );
}
