import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  bool isLoading = false;

  void sendReset() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Link reset telah dikirim ke email Anda"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lupa Password")),
     body: Stack(
  children: [

    // BACKGROUND HIJAU
    Container(
      height: 250,
      color: Colors.green,
    ),

    SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      const Text(
                        "Reset Password",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 20),

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
                          if (!value.contains("@")) {
                            return "Email tidak valid";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: sendReset,
                              child: const Text("Kirim Link Reset"),
                            ),

                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Kembali ke Login"),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    )
  ],
),

    );
  }
}