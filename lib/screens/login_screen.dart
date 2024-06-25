import 'dart:developer';

import 'package:coinone_gallery/bloc/authentication/authentication_bloc.dart';
import 'package:coinone_gallery/core/const_size.dart';
import 'package:coinone_gallery/screens/signup_screen.dart';
import 'package:coinone_gallery/widgets/custom_button.dart';
import 'package:coinone_gallery/widgets/loading_button.dart';
import 'package:coinone_gallery/widgets/text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
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
                  state is AuthenticationLoadingState
                      ? const LoadingButton()
                      : CustomButton(
                          title: "Login",
                          onTap: () {
                            context
                                .read<AuthenticationBloc>()
                                .add(LoginButtonClickEvent());
                          },
                        ),
                  height20,
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account?  ",
                        children: <TextSpan>[
                          TextSpan(
                            text: 'SignUp',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
