import 'package:app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';


class authField extends StatelessWidget {
  final String hintText;
  final controller;
  const authField({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText,labelStyle: TextStyle(color: Colors.black), ),
    );
  }
}