import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 768;
          final crossAxisCount = constraints.maxWidth < 600
              ? 1
              : constraints.maxWidth < 1000
                  ? 2
                  : 3;

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
                    const SectionTitle(
                      title: 'Projects',
                      subtitle: 'Open-source work & personal builds',
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: crossAxisCount == 1 ? 1.8 : 1.4,
                      ),
                      itemCount: kProjects.length,
                      itemBuilder: (context, i) =>
                          _ProjectCard(project: kProjects[i]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectEntry project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovering = false;

  Future<void> _openUrl(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () => _openUrl(widget.project.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _hovering ? AppColors.cardElevated : AppColors.background,
            border: Border.all(
              color: _hovering
                  ? AppColors.accent.withValues(alpha: 0.5)
                  : AppColors.border,
              width: _hovering ? 1.5 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.12),
                      blurRadius: 24,
                      spreadRadius: 4,
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.folder_outlined,
                      color: AppColors.accent,
                      size: 20,
                    ),
                  ),
                  const Spacer(),
                  AnimatedOpacity(
                    opacity: _hovering ? 1.0 : 0.5,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      Icons.open_in_new,
                      color: AppColors.accent,
                      size: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Name
              Text(
                widget.project.name,
                style: GoogleFonts.spaceGrotesk(
                  color: _hovering ? AppColors.accent : AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),

              // Description
              Expanded(
                child: Text(
                  widget.project.description,
                  style: GoogleFonts.inter(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    height: 1.6,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 12),

              // Tech chips
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: widget.project.techs
                    .map((t) => _SmallChip(label: t))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SmallChip extends StatelessWidget {
  final String label;

  const _SmallChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.07),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: AppColors.textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
