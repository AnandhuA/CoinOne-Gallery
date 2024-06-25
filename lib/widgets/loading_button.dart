import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Lottie.asset(
          "assets/loading.json",
          width: 80,
        ),
      ),
    );
  }
}
