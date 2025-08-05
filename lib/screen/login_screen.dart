import 'package:flutter/material.dart';
import 'package:she_can_foundation_test_1/screen/dashboard_screen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.volunteer_activism, size: 80, color: Colors.deepPurple),
              const SizedBox(height: 20),
              Text("Welcome Intern!", style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 20),
              TextField(decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder())),
              const SizedBox(height: 12),
              TextField(obscureText: true, decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder())),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const DashboardScreen()),
                ),
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}