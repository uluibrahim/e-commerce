import 'package:flutter/material.dart';

class GreyContainerWithText extends Container {
  final String text;
  GreyContainerWithText({Key? key, required this.text})
      : super(
          key: key,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xfff3f3f3),
          ),
          child: Text(text),
        );
}
