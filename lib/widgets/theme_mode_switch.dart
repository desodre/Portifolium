import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../main.dart';

class ThemeModeSwitch extends StatelessWidget {
  const ThemeModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return IconButton(
      onPressed: () {
        themeNotifier.value =
            isDark ? ThemeMode.light : ThemeMode.dark;
      },
      icon: Icon(
        isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
        color: isDark ? AppColors.accent : AppColors.lightTextPrimary,
      ),
      tooltip: 'Toggle Theme',
    );
  }
}
