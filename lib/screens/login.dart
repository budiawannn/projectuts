import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;

  void login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    // login dummy
    if (emailController.text == "admin@test.com" &&
        passwordController.text == "Admin123") {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login gagal")),
      );
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
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    if (value.length < 8) {
                      return "Minimal 8 karakter";
                    }
                    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(value)) {
                      return "Harus mengandung huruf dan angka";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // BUTTON LOGIN / LOADING
                isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
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