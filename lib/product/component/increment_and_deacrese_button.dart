import 'package:flutter/material.dart';

class IncrementAndDeacreseButton extends Container {
  final void Function()? incrementFunction;
  final void Function()? deacreseFunction;
  final int count;
  IncrementAndDeacreseButton(
      {Key? key,
      this.deacreseFunction,
      this.incrementFunction,
      required this.count})
      : super(
          key: key,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 229, 226, 226),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              IconButton(
                  onPressed: deacreseFunction, icon: const Icon(Icons.remove)),
              Text("  $count  "),
              IconButton(
                  onPressed: incrementFunction, icon: const Icon(Icons.add)),
            ],
          ),
        );
}
