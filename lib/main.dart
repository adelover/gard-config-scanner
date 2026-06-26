import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/scan_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/config_provider.dart';
import 'screens/auth_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScanProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ConfigProvider()),
      ],
      child: const GardConfigScannerApp(),
    ),
  );
}

class GardConfigScannerApp extends StatelessWidget {
  const GardConfigScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return MaterialApp(
      title: 'Gard Config Scanner',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF0A0E17),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF0A0E17),
          secondary: Color(0xFF00E676),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0A0E17),
        scaffoldBackgroundColor: const Color(0xFF05070B),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF0A0E17),
          secondary: Color(0xFF00E676),
          surface: Color(0xFF0E1420),
        ),
      ),
      home: const AuthScreen(),
    );
  }
}
