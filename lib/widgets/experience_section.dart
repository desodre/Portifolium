import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        return Container(
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
                  const SectionTitle(
                    title: 'Experience',
                    subtitle: 'My professional journey',
                  ),
                  ...List.generate(kExperiences.length, (i) {
                    final isLast = i == kExperiences.length - 1;
                    return _TimelineEntry(
                      entry: kExperiences[i],
                      isLast: isLast,
                      isMobile: isMobile,
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  final ExperienceEntry entry;
  final bool isLast;
  final bool isMobile;

  const _TimelineEntry({
    required this.entry,
    required this.isLast,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline column
          SizedBox(
            width: 28,
            child: Column(
              children: [
                // Dot
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: entry.isCurrent ? AppColors.accent : AppColors.surface,
                    border: Border.all(
                      color: AppColors.accent,
                      width: 2,
                    ),
                    boxShadow: entry.isCurrent
                        ? [
                            BoxShadow(
                              color: AppColors.accent.withValues(alpha: 0.4),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ]
                        : [],
                  ),
                ),
                // Line
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppColors.border,
                      margin: const EdgeInsets.only(top: 4, bottom: 0),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 20),

          // Card
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
              child: _ExperienceCard(entry: entry, isMobile: isMobile),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final ExperienceEntry entry;
  final bool isMobile;

  const _ExperienceCard({required this.entry, required this.isMobile});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _hovering ? AppColors.cardElevated : AppColors.surface,
          border: Border.all(
            color: _hovering ? AppColors.accent.withValues(alpha: 0.4) : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.08),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                Text(
                  widget.entry.role,
                  style: GoogleFonts.spaceGrotesk(
                    color: AppColors.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (widget.entry.isCurrent)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.15),
                      border: Border.all(
                          color: AppColors.accent.withValues(alpha: 0.4)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Current',
                      style: GoogleFonts.inter(
                        color: AppColors.accent,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  widget.entry.company,
                  style: GoogleFonts.inter(
                    color: AppColors.accent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Text('·', style: GoogleFonts.inter(color: AppColors.border)),
                const SizedBox(width: 8),
                Text(
                  widget.entry.period,
                  style: GoogleFonts.inter(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Bullets
            ...widget.entry.bullets.map(
              (b) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.accent.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        b,
                        style: GoogleFonts.inter(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Tech chips
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: widget.entry.techs
                  .map((t) => _TechChip(label: t))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String label;

  const _TechChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.08),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.25)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: AppColors.accent,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
