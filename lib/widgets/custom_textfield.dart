// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormfield extends StatelessWidget {
  CustomTextFormfield({super.key, this.text, this.icon, this.onchanged});
  String? text;
  Icon? icon;
  Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'this field is required';
        }
        return null;
      },
      onChanged: onchanged,
      decoration: InputDecoration(
        prefixIcon: icon,
        label: Text(text!),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            6,
          ),
        ),
      ),
    );
  }
}
