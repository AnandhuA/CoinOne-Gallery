import 'dart:async';

import 'package:coinone_gallery/auth/shared_perference.dart';
import 'package:coinone_gallery/bloc/home/home_bloc.dart';
import 'package:coinone_gallery/screens/home_screen.dart';
import 'package:coinone_gallery/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToSignup();
    // featchProductes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/splashLoading.json"),
      ),
    );
  }

  void goToSignup() async {
    final preferences = await SharedPreferences.getInstance();
    final userLoggedIn = preferences.get(rememberMeKey);
    Timer(const Duration(seconds: 3), () {
      if (userLoggedIn == null || userLoggedIn == false) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignupScreen(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      }
    });
  }

  void featchProductes() {
    context.read<HomeBloc>().add(ProductFeatchingEvent());
  }
}
