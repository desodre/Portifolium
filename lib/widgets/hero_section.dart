import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

class HeroSection extends StatelessWidget {
  final void Function(String section) onScrollToSection;

  const HeroSection({super.key, required this.onScrollToSection});

  Future<void> _openUrl(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final screenH = MediaQuery.of(context).size.height;

        return Container(
          constraints: BoxConstraints(minHeight: screenH - 64),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 40,
            vertical: isMobile ? 60 : 80,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: isMobile
                  ? _buildMobileLayout(context)
                  : _buildDesktopLayout(context),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: _buildTextContent(context, isMobile: false),
        ),
        const SizedBox(width: 60),
        _buildAvatar(radius: 110),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAvatar(radius: 80),
        const SizedBox(height: 40),
        _buildTextContent(context, isMobile: true),
      ],
    );
  }

  Widget _buildAvatar({required double radius}) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.accent, width: 3),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.35),
            blurRadius: 40,
            spreadRadius: 6,
          ),
        ],
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: const NetworkImage(kAvatarUrl),
        backgroundColor: AppColors.surface,
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Greeting badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.1),
            border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '👋  Hello, World!',
            style: GoogleFonts.inter(
              color: AppColors.accent,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Name
        Text(
          kName,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.spaceGrotesk(
            color: AppColors.textPrimary,
            fontSize: isMobile ? 36 : 52,
            fontWeight: FontWeight.w800,
            height: 1.1,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 12),

        // Title
        Text(
          kTitle,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.spaceGrotesk(
            color: AppColors.accent,
            fontSize: isMobile ? 15 : 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 6),

        // Location
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            const Icon(Icons.location_on_outlined,
                size: 15, color: AppColors.textSecondary),
            const SizedBox(width: 4),
            Text(
              kLocation,
              style: GoogleFonts.inter(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Bio
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            kBio,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: GoogleFonts.inter(
              color: AppColors.textSecondary,
              fontSize: 15,
              height: 1.75,
            ),
          ),
        ),
        const SizedBox(height: 32),

        // Social links
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 12,
          runSpacing: 12,
          children: [
            _SocialButton(
              icon: Icons.code,
              label: 'GitHub',
              onTap: () => _openUrl(kGitHub),
            ),
            _SocialButton(
              icon: Icons.work_outline,
              label: 'LinkedIn',
              onTap: () => _openUrl(kLinkedIn),
            ),
            _SocialButton(
              icon: Icons.email_outlined,
              label: 'Email',
              onTap: () => _openUrl('mailto:$kEmail'),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Scroll CTA
        GestureDetector(
          onTap: () => onScrollToSection('experience'),
          child: Row(
            mainAxisAlignment:
                isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Text(
                'View my work',
                style: GoogleFonts.inter(
                  color: AppColors.accent,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.arrow_downward,
                  size: 16, color: AppColors.accent),
            ],
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: _hovering ? AppColors.accent : AppColors.surface,
            border: Border.all(
              color: _hovering ? AppColors.accent : AppColors.border,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.25),
                      blurRadius: 12,
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 16,
                color: _hovering ? AppColors.background : AppColors.textPrimary,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  color:
                      _hovering ? AppColors.background : AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
