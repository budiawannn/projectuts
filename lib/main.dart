import 'package:flutter/material.dart';
import 'package:projectuts/screens/dashboard.dart';
import 'package:projectuts/screens/forgotpassword.dart';
import 'package:projectuts/screens/login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // route sederhana
      initialRoute: '/',

      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/forgot': (context) => ForgotPasswordScreen(),
      },
    );
  }
}