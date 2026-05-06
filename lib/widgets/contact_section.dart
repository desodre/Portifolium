import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../main.dart';
import 'section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _openUrl(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

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
                        title: content.sectionContact,
                        subtitle: content.sectionContactSubtitle,
                      ),
                      Center(
                        child: Column(
                          children: [
                            // Availability badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppColors.accentMode(context)
                                    .withValues(alpha: 0.1),
                                border: Border.all(
                                  color: AppColors.accentMode(context)
                                      .withValues(alpha: 0.35),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.accentMode(context),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    content.contactAvailableLabel,
                                    style: GoogleFonts.inter(
                                      color: AppColors.accentMode(context),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),

                            // Contact buttons
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 16,
                              runSpacing: 16,
                              children: [
                                _ContactButton(
                                  icon: Icons.email_outlined,
                                  label: 'Email',
                                  sublabel: kEmail,
                                  onTap: () => _openUrl('mailto:$kEmail'),
                                ),
                                _ContactButton(
                                  icon: Icons.code,
                                  label: 'GitHub',
                                  sublabel: 'github.com/desodre',
                                  onTap: () => _openUrl(kGitHub),
                                ),
                                _ContactButton(
                                  icon: Icons.work_outline,
                                  label: 'LinkedIn',
                                  sublabel: 'in/jhonsodre',
                                  onTap: () => _openUrl(kLinkedIn),
                                ),
                                _ContactButton(
                                  icon: Icons.phone_outlined,
                                  label: 'Phone',
                                  sublabel: kPhone,
                                  onTap: () => _openUrl(
                                    'tel:${kPhone.replaceAll(RegExp(r"[^\d+]"), "")}',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 60),

                            // Footer
                            Container(
                              height: 1,
                              color: AppColors.borderMode(context),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '© 2026 Jhonatha Cirilo Sodre · ',
                                  style: GoogleFonts.inter(
                                    color:
                                        AppColors.textSecondaryMode(context),
                                    fontSize: 13,
                                  ),
                                ),
                                Icon(Icons.favorite,
                                    color: AppColors.accentMode(context),
                                    size: 14),
                                Text(
                                  ' ${content.contactBuiltWith}',
                                  style: GoogleFonts.inter(
                                    color:
                                        AppColors.textSecondaryMode(context),
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
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

class _ContactButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String sublabel;
  final VoidCallback onTap;

  const _ContactButton({
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.onTap,
  });

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) => setState(() => _hovering = value),
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 180,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: _hovering ? AppColors.accentMode(context) : AppColors.surfaceMode(context),
          border: Border.all(
            color: _hovering ? AppColors.accentMode(context) : AppColors.borderMode(context),
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            Icon(
              widget.icon,
              color:
                  _hovering ? AppColors.backgroundMode(context) : AppColors.accentMode(context),
              size: 28,
            ),
            const SizedBox(height: 10),
            Text(
              widget.label,
              style: GoogleFonts.spaceGrotesk(
                color:
                    _hovering ? AppColors.backgroundMode(context) : AppColors.textPrimaryMode(context),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.sublabel,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: _hovering
                    ? AppColors.backgroundMode(context).withValues(alpha: 0.7)
                    : AppColors.textSecondaryMode(context),
                fontSize: 11,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
