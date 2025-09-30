import 'package:flutter/material.dart';

class AppColors {
  // Yolo247 Brand Colors
  static const Color primary = Color(0xFF1B5E20); // Dark Green
  static const Color primaryLight = Color(0xFF4CAF50); // Light Green
  static const Color primaryDark = Color(0xFF0D3B0F); // Darker Green

  // Secondary Colors
  static const Color secondary = Color(0xFFFFD700); // Gold
  static const Color secondaryLight = Color(0xFFFFF176); // Light Gold
  static const Color secondaryDark = Color(0xFFF57F17); // Dark Gold

  // Accent Colors
  static const Color accent = Color(0xFFE8F5E8); // Light Green Background
  static const Color accentDark = Color(0xFFC8E6C9); // Medium Green Background

  // Cricket Field Colors
  static const Color fieldGreen = Color(0xFF2E7D32); // Cricket Field Green
  static const Color fieldLight = Color(0xFF66BB6A); // Light Field Green
  static const Color fieldDark = Color(0xFF1B5E20); // Dark Field Green

  // Text Colors
  static const Color textPrimary = Color(0xFF212121); // Dark Gray
  static const Color textSecondary = Color(0xFF757575); // Medium Gray
  static const Color textLight = Color(0xFFBDBDBD); // Light Gray
  static const Color textWhite = Color(0xFFFFFFFF); // White

  // Background Colors
  static const Color background = Color(0xFFF5F5F5); // Light Gray Background
  static const Color surface = Color(0xFFFFFFFF); // White Surface
  static const Color surfaceDark = Color(0xFFEEEEEE); // Dark Surface

  // Status Colors
  static const Color success = Color(0xFF4CAF50); // Green
  static const Color warning = Color(0xFFFF9800); // Orange
  static const Color error = Color(0xFFF44336); // Red
  static const Color info = Color(0xFF2196F3); // Blue

  // Button Colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = Color(0xFFE0E0E0);

  // Border Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFFBDBDBD);

  // Shadow Colors
  static const Color shadow = Color(0x1A000000);
  static const Color shadowDark = Color(0x33000000);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static const LinearGradient fieldGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [fieldLight, fieldGreen],
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondaryLight, secondary],
  );
}
