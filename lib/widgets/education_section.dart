import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../main.dart';
import 'section_title.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: languageNotifier,
      builder: (context, lang, _) {
        final content = kContent[lang]!;
        return Container(
          decoration: BoxDecoration(color: AppColors.surfaceMode(context)),
          child: LayoutBuilder(
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
                          title: content.sectionEducation,
                          subtitle: content.sectionEducationSubtitle,
                        ),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            ...content.education.map(
                              (e) =>
                                  _EducationCard(entry: e, isMobile: isMobile),
                            ),
                          ],
                        ),
                        const SizedBox(height: 48),
                        _CoursesBlock(
                          heading: content.coursesHeading,
                          courses: content.courses,
                          isMobile: isMobile,
                        ),
                        const SizedBox(height: 48),
                        _LanguagesBlock(
                          heading: content.spokenLanguagesHeading,
                          languages: content.languages,
                          isMobile: isMobile,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _EducationCard extends StatefulWidget {
  final EducationEntry entry;
  final bool isMobile;

  const _EducationCard({required this.entry, required this.isMobile});

  @override
  State<_EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<_EducationCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        constraints: BoxConstraints(
          minWidth: widget.isMobile ? double.infinity : 340,
          maxWidth: widget.isMobile ? double.infinity : 520,
        ),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _hovering ? AppColors.card(context) : AppColors.backgroundMode(context),
          border: Border.all(
            color:
                _hovering ? AppColors.accent.withValues(alpha: 0.4) : AppColors.borderMode(context),
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.08),
                    blurRadius: 20,
                  ),
                ]
              : [],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.accent.withValues(alpha: 0.25),
                ),
              ),
              child: Icon(
                Icons.school_outlined,
                color: AppColors.accentMode(context),
                size: 22,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.entry.degree,
                    style: GoogleFonts.spaceGrotesk(
                      color: AppColors.textPrimaryMode(context),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.entry.institution,
                    style: GoogleFonts.inter(
                      color: AppColors.accentMode(context),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.entry.period,
                    style: GoogleFonts.inter(
                      color: AppColors.textSecondaryMode(context),
                      fontSize: 12,
                    ),
                  ),
                  if (widget.entry.note != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      widget.entry.note!,
                      style: GoogleFonts.inter(
                        color: AppColors.textSecondaryMode(context).withValues(alpha: 0.7),
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CoursesBlock extends StatelessWidget {
  final String heading;
  final List<CourseEntry> courses;
  final bool isMobile;

  const _CoursesBlock({
    required this.heading,
    required this.courses,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 3,
              height: 18,
              decoration: BoxDecoration(
                color: AppColors.accentMode(context),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              heading,
              style: GoogleFonts.spaceGrotesk(
                color: AppColors.textPrimaryMode(context),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: courses
              .map(
                (c) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundMode(context),
                    border: Border.all(color: AppColors.borderMode(context)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified_outlined,
                          color: AppColors.accentMode(context), size: 16),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            c.title,
                            style: GoogleFonts.inter(
                              color: AppColors.textPrimaryMode(context),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${c.provider} · ${c.year}',
                            style: GoogleFonts.inter(
                              color: AppColors.textSecondaryMode(context),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _LanguagesBlock extends StatelessWidget {
  final String heading;
  final List<Map<String, String>> languages;
  final bool isMobile;

  const _LanguagesBlock({
    required this.heading,
    required this.languages,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 3,
              height: 18,
              decoration: BoxDecoration(
                color: AppColors.accentMode(context),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              heading,
              style: GoogleFonts.spaceGrotesk(
                color: AppColors.textPrimaryMode(context),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: languages
              .map(
                (lang) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundMode(context),
                    border: Border.all(color: AppColors.borderMode(context)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.language,
                          color: AppColors.accentMode(context), size: 15),
                      const SizedBox(width: 8),
                      Text(
                        lang['name']!,
                        style: GoogleFonts.inter(
                          color: AppColors.textPrimaryMode(context),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '· ${lang['level']!}',
                        style: GoogleFonts.inter(
                          color: AppColors.textSecondaryMode(context),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
