import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../main.dart';
import 'section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: languageNotifier,
      builder: (context, lang, _) {
        final content = kContent[lang]!;
        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 768;
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 40,
                vertical: isMobile ? 60 : 80,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(
                        title: content.sectionSkills,
                        subtitle: content.sectionSkillsSubtitle,
                      ),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: content.skills
                            .map((cat) => _SkillCategoryCard(category: cat))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _SkillCategoryCard extends StatefulWidget {
  final SkillCategory category;

  const _SkillCategoryCard({required this.category});

  @override
  State<_SkillCategoryCard> createState() => _SkillCategoryCardState();
}

class _SkillCategoryCardState extends State<_SkillCategoryCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Each card takes up appropriate width
        return MouseRegion(
          onEnter: (_) => setState(() => _hovering = true),
          onExit: (_) => setState(() => _hovering = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            constraints: const BoxConstraints(minWidth: 220),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: _hovering ? AppColors.card(context) : AppColors.surfaceMode(context),
              border: Border.all(
                color: _hovering
                    ? AppColors.accentMode(context).withValues(alpha: 0.35)
                    : AppColors.borderMode(context),
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: _hovering
                  ? [
                      BoxShadow(
                        color: AppColors.accentMode(context).withValues(alpha: 0.07),
                        blurRadius: 20,
                      ),
                    ]
                  : [],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 3,
                      height: 16,
                      decoration: BoxDecoration(
                        color: AppColors.accentMode(context),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.category.label,
                      style: GoogleFonts.spaceGrotesk(
                        color: AppColors.textPrimaryMode(context),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.category.skills
                      .map((s) => _SkillChip(label: s))
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _hovering
              ? AppColors.accentMode(context).withValues(alpha: 0.15)
              : AppColors.backgroundMode(context),
          border: Border.all(
            color: _hovering
                ? AppColors.accentMode(context)
                : AppColors.borderMode(context),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          widget.label,
          style: GoogleFonts.inter(
            color: _hovering ? AppColors.accentMode(context) : AppColors.textSecondaryMode(context),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
