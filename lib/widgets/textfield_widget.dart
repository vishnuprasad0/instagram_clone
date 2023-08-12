import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hinttext;
  final bool ispassword;
  final TextInputType textInputType;
  const MyTextfield({super.key, 
  required this.textEditingController,
  required this.hinttext,
  this.ispassword=true,
  required this.textInputType}
  );

  @override
  Widget build(BuildContext context) {
      final inputborder=OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return TextField(
      controller: textEditingController ,
      decoration: InputDecoration(
        hintText: hinttext,
        border: inputborder,
        focusedBorder: inputborder,
        enabledBorder: inputborder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
    ),
    keyboardType: textInputType,
    obscureText: ispassword ,
    );
  }
}