import 'package:coinone_gallery/core/const_size.dart';
import 'package:coinone_gallery/widgets/custom_button.dart';
import 'package:coinone_gallery/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                "SignUp",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              height25,
              TextFieldWidget(
                labelText: "Name",
                keyboardType: TextInputType.name,
              ),
              height20,
              TextFieldWidget(
                labelText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              height20,
              TextFieldWidget(
                labelText: "Password",
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                suffixIcon: true,
              ),
              height20,
              const CustomButton(title: "SignUp",)
            ],
          ),
        ),
      ),
    );
  }
}
