import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _openUrl(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
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
                  const SectionTitle(
                    title: 'Contact',
                    subtitle: "Let's build something together",
                  ),
                  Center(
                    child: Column(
                      children: [
                        // Tagline
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Text(
                            'I\'m always open to new opportunities and interesting projects. '
                            'Feel free to reach out!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: AppColors.textSecondary,
                              fontSize: 15,
                              height: 1.7,
                            ),
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
                              onTap: () => _openUrl('tel:${kPhone.replaceAll(RegExp(r"[^\d+]"), "")}'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),

                        // Footer
                        Container(
                          height: 1,
                          color: AppColors.border,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '© 2026 Jhonatha Cirilo Sodre · Built with ',
                              style: GoogleFonts.inter(
                                color: AppColors.textSecondary,
                                fontSize: 13,
                              ),
                            ),
                            const Icon(Icons.favorite,
                                color: AppColors.accent, size: 14),
                            Text(
                              ' using Flutter',
                              style: GoogleFonts.inter(
                                color: AppColors.textSecondary,
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
          color: _hovering ? AppColors.accent : AppColors.surface,
          border: Border.all(
            color: _hovering ? AppColors.accent : AppColors.border,
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
                  _hovering ? AppColors.background : AppColors.accent,
              size: 28,
            ),
            const SizedBox(height: 10),
            Text(
              widget.label,
              style: GoogleFonts.spaceGrotesk(
                color:
                    _hovering ? AppColors.background : AppColors.textPrimary,
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
                    ? AppColors.background.withValues(alpha: 0.7)
                    : AppColors.textSecondary,
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
