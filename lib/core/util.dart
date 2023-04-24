import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_app/core/failure.dart';

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
  log(message);
}
