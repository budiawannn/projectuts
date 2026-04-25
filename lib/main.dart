import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/forgotpassword.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String? loggedInUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/forgot': (context) => ForgotPasswordScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}