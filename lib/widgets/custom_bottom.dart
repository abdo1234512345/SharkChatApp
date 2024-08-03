// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  CustomBottom({super.key, this.text, this.onTap});
  String? text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(text!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
        ),
      ),
    );
  }
}
