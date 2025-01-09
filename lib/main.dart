import 'package:flutter/material.dart';
import 'package:template_project/Screens/signin_screen.dart';
import 'package:template_project/Screens/signup_screen.dart';
import 'package:template_project/Screens/welcome_screen.dart';
import 'package:template_project/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wireframee App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/signin': (context) => const LoginScreen(),
        '/signup': (context) =>  SignupScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
