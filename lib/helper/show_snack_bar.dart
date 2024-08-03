// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

void SnackbarMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      content: Center(
        child: Text(message),
      ),
    ),
  );
}
