import 'package:coinone_gallery/auth/validation.dart';
import 'package:coinone_gallery/bloc/authentication/authentication_bloc.dart';
import 'package:coinone_gallery/core/colors.dart';
import 'package:coinone_gallery/core/const_size.dart';
import 'package:coinone_gallery/screens/home_screen.dart';
import 'package:coinone_gallery/screens/signup_screen.dart';
import 'package:coinone_gallery/widgets/check_box_widget.dart';
import 'package:coinone_gallery/widgets/custom_button.dart';
import 'package:coinone_gallery/widgets/custom_rich_text.dart';
import 'package:coinone_gallery/widgets/custom_snacbar.dart';
import 'package:coinone_gallery/widgets/loading_button.dart';
import 'package:coinone_gallery/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
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
                context: context, message: state.error, color: errorColor);
          } else if (state is AuthenticationSuccessState) {
            customSnackbar(
                context: context, message: "Success", color: successColor);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false);
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
                      "Login",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    height25,
                    TextFieldWidget(
                      validation: validateEmail,
                      labelText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    height15,
                    TextFieldWidget(
                      validation: validatePassword,
                      labelText: "Password",
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      suffixIcon: true,
                    ),
                    height15,
                    const CheckBoxWidget(),
                    state is AuthenticationLoadingState
                        ? const LoadingButton()
                        : CustomButton(
                            title: "Login",
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthenticationBloc>().add(
                                      LoginButtonClickEvent(
                                        email: _emailController.text,
                                        passsword: _passwordController.text,
                                      ),
                                    );
                              }
                            },
                          ),
                    height20,
                    CustomRichText(
                      text: "Don't have an account?  ",
                      linkText: 'SignUp',
                      screen: SignupScreen(),
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
