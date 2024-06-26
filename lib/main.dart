import 'package:coinone_gallery/bloc/Product/product_detail_bloc.dart';
import 'package:coinone_gallery/bloc/authentication/authentication_bloc.dart';
import 'package:coinone_gallery/bloc/home/home_bloc.dart';
import 'package:coinone_gallery/firebase_options.dart';
import 'package:coinone_gallery/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => ProductDetailBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
