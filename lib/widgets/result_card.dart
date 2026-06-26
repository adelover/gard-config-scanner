import 'package:flutter/material.dart';
import '../models/scan_result.dart';

class ResultCard extends StatelessWidget {
  final ScanResult result;
  final VoidCallback onTap;

  const ResultCard({super.key, required this.result, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(result.ip, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(result.serverName ?? 'Unknown Host'),
        trailing: Text('${result.ping} ms', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
        onTap: onTap,
      ),
    );
  }
}
