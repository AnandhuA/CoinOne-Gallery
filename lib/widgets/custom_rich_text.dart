import 'package:coinone_gallery/core/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final String linkText;
  final Widget screen;
  const CustomRichText({
    super.key,
    required this.text,
    required this.linkText,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Don't have an account?  ",
          style: const TextStyle(color: greyColor),
          children: <TextSpan>[
            TextSpan(
              text: 'SignUp',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: greyColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => screen),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
