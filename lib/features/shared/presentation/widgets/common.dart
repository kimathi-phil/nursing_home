import 'package:flutter/material.dart';

import 'package:nursing_home/config/config.dart';

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
