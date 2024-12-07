import 'package:flutter/material.dart';

Widget myContainer(Widget child) {
  return Container(
    width: 98,
    height: 48,
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(255, 255, 255, 255),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(48),
    ),
    child: child,
  );
}
