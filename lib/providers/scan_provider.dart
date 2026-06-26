import 'package:flutter/material.dart';
import '../models/scan_result.dart';
import '../services/network_scanner.dart';

class ScanProvider with ChangeNotifier {
  final NetworkScanner _scanner = NetworkScanner();
  List<ScanResult> _results = [];
  bool _isScanning = false;
  double _progress = 0.0;

  List<ScanResult> get results => _results;
  bool get isScanning => _isScanning;
  double get progress => _progress;

  void startScan(String subnet) async {
    _isScanning = true;
    _results.clear();
    _progress = 0.0;
    notifyListeners();

    // اجرای شبیه‌ساز اسکن شبکه
    for (int i = 1; i <= 254; i++) {
      if (!_isScanning) break;
      _progress = i / 254;
      
      final currentIp = '$subnet.$i';
      final res = await _scanner.pingIp(currentIp);
      
      if (res != null && res.isClean) {
        _results.add(res);
      }
      notifyListeners();
    }

    _isScanning = false;
    notifyListeners();
  }

  void stopScan() {
    _isScanning = false;
    notifyListeners();
  }
}
