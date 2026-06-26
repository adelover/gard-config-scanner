class BenchmarkData {
  final String ip;
  final double downloadSpeed; // Mbps
  final double lossRate;

  BenchmarkData({
    required this.ip,
    required this.downloadSpeed,
    required this.lossRate,
  });
}
