import 'package:flutter/material.dart';
import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _licenseController = TextEditingController();

  void _verifyLicense() {
    if (_licenseController.text == "GARD-CONFIG-VIP") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid License Key! Access Denied.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.security, size: 80, color: Color(0xFF00E676)),
              const SizedBox(height: 24),
              const Text('GARD CONFIG VIP SCANNER', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextField(
                controller: _licenseController,
                decoration: const InputDecoration(labelText: 'Enter Admin License Key'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _verifyLicense,
                child: const Text('Verify & Enter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
