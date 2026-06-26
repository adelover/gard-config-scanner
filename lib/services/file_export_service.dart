import '../models/scan_result.dart';

class FileExportService {
  static String convertResultsToText(List<ScanResult> results) {
    StringBuffer buffer = StringBuffer();
    buffer.writeln('--- GARD CONFIG CLEAN IP LIST ---');
    for (var res in results) {
      buffer.writeln('${res.ip} | Ping: ${res.ping}ms');
    }
    return buffer.toString();
  }
}
