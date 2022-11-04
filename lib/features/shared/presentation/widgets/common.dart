import 'package:flutter/material.dart';

import 'package:flutter_playground/config/config.dart';

void setSnackbar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: const TextStyle(color: kPrimaryColor),
      ),
      elevation: 1,
      backgroundColor: kWhiteColor,
    ),
  );
}
