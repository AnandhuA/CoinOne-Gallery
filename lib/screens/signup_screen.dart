import 'package:coinone_gallery/auth/validation.dart';
import 'package:coinone_gallery/bloc/authentication/authentication_bloc.dart';
import 'package:coinone_gallery/core/const_size.dart';
import 'package:coinone_gallery/screens/login_screen.dart';
import 'package:coinone_gallery/widgets/custom_button.dart';
import 'package:coinone_gallery/widgets/custom_snacbar.dart';
import 'package:coinone_gallery/widgets/loading_button.dart';
import 'package:coinone_gallery/widgets/text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationErrorState) {
            customSnackbar(
                context: context,
                message: state.error,
                color: Colors.red.shade400);
          } else if (state is AuthenticationSuccessState) {
            customSnackbar(
                context: context,
                message: "Success",
                color: Colors.green.shade300);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
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
                      validation: validateName,
                      controller: _nameController,
                      labelText: "Name",
                      keyboardType: TextInputType.name,
                    ),
                    height20,
                    TextFieldWidget(
                      validation: validateEmail,
                      controller: _emailController,
                      labelText: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    height20,
                    TextFieldWidget(
                      validation: validatePassword,
                      controller: _passwordController,
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
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthenticationBloc>().add(
                                      SignUpButtonClickEvent(
                                        email: _emailController.text,
                                        passsword: _passwordController.text,
                                      ),
                                    );
                              }
                            },
                          ),
                    height20,
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account?  ",
                          style: const TextStyle(color: Colors.grey),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Login',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
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
            ),
          );
        },
      ),
    );
  }
}
