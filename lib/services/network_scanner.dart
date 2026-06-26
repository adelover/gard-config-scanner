import 'dart:math';
import '../models/scan_result.dart';

class NetworkScanner {
  Future<ScanResult?> pingIp(String ip) async {
    // شبیه‌سازی تاخیر شبکه برای اسکن پورت‌ها
    await Future.delayed(Duration(milliseconds: Random().nextInt(40) + 10));
    
    // شبیه‌سازی تصادفی برای پیدا کردن آی‌پی تمیز کلودفلر/همراه اول
    final isClean = Random().nextInt(20) == 7; 
    final ping = Random().nextInt(120) + 40;

    return ScanResult(
      ip: ip,
      ping: ping,
      isClean: isClean,
      serverName: isClean ? 'Cloudflare Edge' : null,
    );
  }
}
