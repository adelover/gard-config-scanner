import 'dart:math';
import '../models/benchmark_data.dart';

class BenchmarkEngine {
  Future<BenchmarkData> runSpeedTest(String ip) async {
    await Future.delayed(const Duration(seconds: 1));
    return BenchmarkData(
      ip: ip,
      downloadSpeed: (Random().nextDouble() * 45) + 5,
      lossRate: Random().nextDouble() * 2,
    );
  }
}
