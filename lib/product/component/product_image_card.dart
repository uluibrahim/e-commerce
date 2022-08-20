import 'package:flutter/material.dart';

class ProductImageCard extends Container {
  final String imageUrl;
  ProductImageCard({Key? key, required this.imageUrl})
      : super(
          key: key,
          decoration: BoxDecoration(
            color: const Color(0xfff3f3f3),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
        );
}
