class VlessConfig {
  final String uuid;
  final String address;
  final int port;
  final String remarks;
  final Map<String, String> params;

  VlessConfig({
    required this.uuid,
    required this.address,
    required this.port,
    required this.remarks,
    required this.params,
  });

  String toVlessLink() {
    final query = params.entries.map((e) => '${e.key}=${e.value}').join('&');
    return 'vless://$uuid@$address:$port?$query#$remarks';
  }
}
