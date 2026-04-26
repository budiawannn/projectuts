import 'package:flutter/material.dart';
import 'package:projectuts/main.dart';

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
  String? errorMessage;

  void login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (emailController.text == "admin@test.com" &&
        passwordController.text == "Admin123") {
      MyApp.loggedInUser = emailController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login berhasil")),
      );

      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      setState(() {
        isLoading = false;
        errorMessage = "Email atau password salah";
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login gagal")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔵 BACKGROUND
          Container(
            height: 250,
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
          ),

          // 🔵 CONTENT
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // ERROR MESSAGE
                          if (errorMessage != null)
                            Text(
                              errorMessage!,
                              style: const TextStyle(color: Colors.red),
                            ),

                          if (errorMessage != null)
                            const SizedBox(height: 10),

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
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
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
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible =
                                        !isPasswordVisible;
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
                              if (!RegExp(
                                      r'^(?=.*[A-Za-z])(?=.*\d)')
                                  .hasMatch(value)) {
                                return "Harus mengandung huruf dan angka";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          // BUTTON
                          isLoading
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: login,
                                  child: const Text("Login"),
                                ),

                          // FORGOT PASSWORD
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}