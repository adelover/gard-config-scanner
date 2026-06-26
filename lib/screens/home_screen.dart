import 'package:flutter/material.dart';
import 'scanner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gard Config Hub'), backgroundColor: const Color(0xFF0A0E17)),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.radar),
          label: const Text('Open Cloudflare Scanner Engine'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ScannerScreen()),
            );
          },
        ),
      ),
    );
  }
}
