import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scan_provider.dart';
import '../widgets/result_card.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContextcontext) {
    final scanProvider = Provider.of<ScanProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gard Config Scanner'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: scanProvider.isScanning ? null : () => scanProvider.startScan(),
              child: Text(scanProvider.isScanning ? 'در حال اسکن...' : 'شروع اسکن شبکه'),
            ),
          ),
          if (scanProvider.isScanning)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: LinearProgressIndicator(),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: scanProvider.results.length,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                final result = scanProvider.results[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0), // ایجاد فاصله استاندارد بین کارت‌ها
                  child: ResultCard(result: result),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
