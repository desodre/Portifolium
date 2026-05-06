import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../main.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: languageNotifier,
      builder: (context, lang, _) {
        return InkWell(
          onTap: () => languageNotifier.value = lang == 'pt' ? 'en' : 'pt',
          borderRadius: BorderRadius.circular(6),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderMode(context)),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              lang.toUpperCase(),
              style: GoogleFonts.inter(
                color: AppColors.accentMode(context),
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        );
      },
    );
  }
}
