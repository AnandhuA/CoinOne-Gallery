import 'package:coinone_gallery/core/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const CustomButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: buttonBgColor),
        onPressed: () => onTap(),
        child: Text(
          title,
          style: const TextStyle(color: whiteColor),
        ),
      ),
    );
  }
}
