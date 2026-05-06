import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Common
  static const Color accent = Color(0xFF00D4A3);

  // Dark Mode
  static const Color darkBackground = Color(0xFF0D1117);
  static const Color darkSurface = Color(0xFF161B22);
  static const Color darkBorder = Color(0xFF30363D);
  static const Color darkTextPrimary = Color(0xFFF0F6FC);
  static const Color darkTextSecondary = Color(0xFF8B949E);
  static const Color darkCard = Color(0xFF1C2128);

  // Light Mode
  static const Color lightAccent = Color(0xFF007A5E); // darker teal for WCAG AA on white (~5.3:1)
  static const Color lightBackground = Color(0xFFF0F4F8);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFBBC4CE);
  static const Color lightTextPrimary = Color(0xFF1A1F25);
  static const Color lightTextSecondary = Color(0xFF505860);
  static const Color lightCard = Color(0xFFF8FAFB);

  // Legacy for quick fix
  static const Color background = darkBackground;
  static const Color surface = darkSurface;
  static const Color border = darkBorder;
  static const Color textPrimary = darkTextPrimary;
  static const Color textSecondary = darkTextSecondary;
  static const Color cardElevated = darkCard;

  // Dynamic access
  static Color backgroundMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkBackground : lightBackground;
  static Color surfaceMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkSurface : lightSurface;
  static Color borderMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkBorder : lightBorder;
  static Color textPrimaryMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkTextPrimary : lightTextPrimary;
  static Color textSecondaryMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkTextSecondary : lightTextSecondary;
  static Color card(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkCard : lightCard;
  static Color accentMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? accent : lightAccent;
}

class AppTheme {
  static ThemeData get dark => _buildTheme(Brightness.dark);
  static ThemeData get light => _buildTheme(Brightness.light);

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final base = isDark ? ThemeData.dark() : ThemeData.light();

    final bgColor = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final surfaceColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final txtPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final txtSecondary = isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return base.copyWith(
      scaffoldBackgroundColor: bgColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.accent,
        brightness: brightness,
        surface: surfaceColor,
        primary: isDark ? AppColors.accent : AppColors.lightAccent,
        onPrimary: isDark ? AppColors.darkBackground : Colors.white,
        secondary: isDark ? AppColors.accent : AppColors.lightAccent,
      ),
      textTheme: GoogleFonts.interTextTheme(base.textTheme).copyWith(
        displayLarge: GoogleFonts.spaceGrotesk(
          color: txtPrimary,
          fontSize: 56,
          fontWeight: FontWeight.w700,
          height: 1.1,
        ),
        displayMedium: GoogleFonts.spaceGrotesk(
          color: txtPrimary,
          fontSize: 40,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        displaySmall: GoogleFonts.spaceGrotesk(
          color: txtPrimary,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        headlineLarge: GoogleFonts.spaceGrotesk(
          color: txtPrimary,
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: GoogleFonts.spaceGrotesk(
          color: txtPrimary,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: GoogleFonts.spaceGrotesk(
          color: txtPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.inter(
          color: txtPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.inter(
          color: txtPrimary,
          fontSize: 16,
          height: 1.7,
        ),
        bodyMedium: GoogleFonts.inter(
          color: txtSecondary,
          fontSize: 14,
          height: 1.6,
        ),
        bodySmall: GoogleFonts.inter(
          color: txtSecondary,
          fontSize: 12,
          height: 1.5,
        ),
      ),
    );
  }
}
