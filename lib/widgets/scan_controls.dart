import 'package:flutter/material.dart';

class ScanControls extends StatelessWidget {
  final bool isScanning;
  final VoidCallback onStart;
  final VoidCallback onStop;

  const ScanControls({
    super.key,
    required this.isScanning,
    required this.onStart,
    required this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isScanning ? onStop : onStart,
      style: ElevatedButton.styleFrom(
        backgroundColor: isScanning ? Colors.red : const Color(0xFF00E676),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      ),
      child: Text(isScanning ? 'STOP SCAN' : 'START SCAN', style: const TextStyle(color: Colors.white)),
    );
  }
}
