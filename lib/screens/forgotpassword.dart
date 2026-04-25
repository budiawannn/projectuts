import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final emailController = TextEditingController();

  void sendReset(BuildContext context) {
    // dummy action
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lupa Password"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => sendReset(context),
              child: Text("Kirim Link Reset"),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Kembali ke Login"),
            ),
          ],
        ),
      ),
    );
  }
}