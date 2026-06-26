import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scan_provider.dart';
import '../widgets/ip_input_field.dart';
import '../widgets/scan_controls.dart';
import '../widgets/result_card.dart';
import '../widgets/loading_shimmer.dart';
import 'config_generator_screen.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final _subnetController = TextEditingController(text: '172.67.14');

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Scanner Engine'), backgroundColor: const Color(0xFF0A0E17)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IpInputField(controller: _subnetController),
            const SizedBox(height: 16),
            if (scanProvider.isScanning) const LoadingShimmer(),
            ScanControls(
              isScanning: scanProvider.isScanning,
              onStart: () => scanProvider.startScan(_subnetController.text),
              onStop: () => scanProvider.stopScan(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: scanProvider.results.length,
                itemSpacing: 8,
                itemBuilder: (context, index) {
                  final item = scanProvider.results[index];
                  return ResultCard(
                    result: item,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ConfigGeneratorScreen(cleanIp: item.ip),
                        ),
                      );
                    },
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
