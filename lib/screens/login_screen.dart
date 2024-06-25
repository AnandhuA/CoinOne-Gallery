import 'package:coinone_gallery/core/const_size.dart';
import 'package:coinone_gallery/widgets/custom_button.dart';
import 'package:coinone_gallery/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              height25,
              TextFieldWidget(
                labelText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              height15,
              TextFieldWidget(
                labelText: "Password",
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                suffixIcon: true,
              ),
              height15,
              const CustomButton(
                title: "Login",
              )
            ],
          ),
        ),
      ),
    );
  }
}
