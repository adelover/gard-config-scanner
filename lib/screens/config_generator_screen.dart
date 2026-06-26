import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/config_provider.dart';

class ConfigGeneratorScreen extends StatelessWidget {
  final String cleanIp;
  const ConfigGeneratorScreen({super.key, required this.cleanIp});

  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);
    final finalConfig = configProvider.generateCleanConfig(cleanIp).toVlessLink();

    return Scaffold(
      appBar: AppBar(title: const Text('VLESS Config Generator'), backgroundColor: const Color(0xFF0A0E17)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Your Clean IP VLESS Configuration:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(8)),
              child: Text(finalConfig, style: const TextStyle(fontFamily: 'monospace', fontSize: 12)),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.copy),
              label: const Text('Copy to Clipboard'),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: finalConfig));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Config copied successfully!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
