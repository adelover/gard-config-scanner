class ScanResult {
  final String ip;
  final int ping;
  final bool isClean;
  final String? serverName;

  ScanResult({
    required this.ip,
    required this.ping,
    required this.isClean,
    this.serverName,
  });
}
