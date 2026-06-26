import 'package:flutter/material.dart';
import 'constants.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppConstants.primaryBg,
      cardColor: AppConstants.cardBg,
      hintColor: AppConstants.textMuted,
      colorScheme: const ColorScheme.dark(
        primary: AppConstants.accentNeon,
        secondary: AppConstants.accentNeon,
      ),
    );
  }
}
