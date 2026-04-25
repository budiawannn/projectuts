import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // key untuk validasi form
  final _formKey = GlobalKey<FormState>();

  // controller input
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    // cek validasi
    if (_formKey.currentState!.validate()) {
      // kalau valid → lanjut dashboard 
      Navigator.pushNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey, 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                // EMAIL
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email tidak boleh kosong";
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Email tidak valid";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                // PASSWORD
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                  if (value == null || value.isEmpty) {
                  return "Password tidak boleh kosong";
                  }

                  if (value.length < 8) {
                    return "Minimal 8 karakter";
                  }

                  // HARUS ADA HURUF DAN ANGKA
                  if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(value)) {
                    return "Harus mengandung huruf dan angka";
                  }

                  return null;
                },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: login,
                  child: const Text("Login"),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot');
                  },
                  child: const Text("Lupa Password?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}