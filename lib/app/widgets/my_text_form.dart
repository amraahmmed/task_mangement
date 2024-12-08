import 'package:flutter/material.dart';

Widget myTextForm(
    {required String labelText,
    String text = "",
    Color? color,
    bool obscureText = false,
    bool icon = false, required TextEditingController controller}) {
  return TextFormField(
    style: TextStyle(color: color, fontSize: 22),
    obscureText: obscureText,
    cursorColor: const Color.fromARGB(255, 255, 77, 12),
    initialValue: text,
    decoration: InputDecoration(
      suffixIcon: icon
          ? const Icon(
              Icons.visibility_off,
              color: Colors.white,
            )
          : null,
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 255, 77, 12),
        ),
      ),
      labelText: labelText,
      border: const UnderlineInputBorder(),
    ),
  );
}