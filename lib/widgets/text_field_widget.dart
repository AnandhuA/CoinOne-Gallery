import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String labelText;
  bool obscureText;
  final TextInputType keyboardType;
  final bool suffixIcon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validation;
  TextFieldWidget(
      {super.key,
      required this.labelText,
      this.obscureText = false,
      this.suffixIcon = false,
      required this.keyboardType,
      required this.controller,
      required this.validation});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validation,
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
      
        labelText: widget.labelText,
        suffixIcon: widget.suffixIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: widget.obscureText
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              )
            : null,
      ),
    );
  }
}
