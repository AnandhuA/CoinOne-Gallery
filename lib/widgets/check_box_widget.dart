import 'package:flutter/material.dart';

bool? rememberMe = false;

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({
    super.key,
  });

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: rememberMe,
            onChanged: (value) {
              setState(() {
                rememberMe = value;
              });
            }),
        const Text("Remember Me")
      ],
    );
  }
}
