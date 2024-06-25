
import 'package:coinone_gallery/bloc/authentication/authentication_bloc.dart';
import 'package:coinone_gallery/core/const_size.dart';
import 'package:coinone_gallery/screens/login_screen.dart';
import 'package:coinone_gallery/widgets/custom_button.dart';
import 'package:coinone_gallery/widgets/loading_button.dart';
import 'package:coinone_gallery/widgets/text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                  state is AuthenticationLoadingState
                      ? const LoadingButton()
                      : CustomButton(
                          title: "SignUp",
                          onTap: () {
                            context
                                .read<AuthenticationBloc>()
                                .add(SignUpButtonClickEvent());
                          },
                        ),
                  height20,
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account?  ",
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
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
