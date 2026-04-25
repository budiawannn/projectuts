import 'package:flutter/material.dart';
import '../main.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ambil user dari global state
    final user = MyApp.loggedInUser ?? "User";

    return Scaffold(
    appBar: AppBar(
    title: const Text("Dashboard"),
    actions: [
      IconButton(
        icon: const Icon(Icons.logout),
        onPressed: () {
          // HAPUS DATA USER
          MyApp.loggedInUser = null;

          // KEMBALI KE LOGIN (hapus semua route)
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/',
            (route) => false,
          );
        },
      )
    ],
  ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // WELCOME TEXT
            Text(
              "Selamat datang, $user",
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // LIST DATA
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.list),
                      title: Text("Item ${index + 1}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}