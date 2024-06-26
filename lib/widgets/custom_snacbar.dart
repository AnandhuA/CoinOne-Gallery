import 'package:coinone_gallery/core/colors.dart';
import 'package:flutter/material.dart';

customSnackbar({
  required BuildContext context,
  required String message,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: whiteColor,
        ),
      ),
      backgroundColor: color,
      duration: const Duration(
        milliseconds: 1200,
      ),
    ),
  );
}
