import 'package:flutter/material.dart';
import '../models/vless_config.dart';

class ConfigProvider with ChangeNotifier {
  VlessConfig generateCleanConfig(String cleanIp) {
    return VlessConfig(
      uuid: '00000000-0000-0000-0000-000000000000',
      address: cleanIp,
      port: 443,
      remarks: 'GardConfig_Clean_IP',
      params: {
        'encryption': 'none',
        'security': 'reality',
        'type': 'tcp',
      },
    );
  }
}
