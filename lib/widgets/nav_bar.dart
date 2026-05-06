import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme_mode_switch.dart';
import 'language_switch.dart';
import '../theme/app_theme.dart';

const double _kNavHeight = 64;
const List<_NavItem> _kNavItems = [
  _NavItem(label: 'Home', section: 'home'),
  _NavItem(label: 'Experience', section: 'experience'),
  _NavItem(label: 'Projects', section: 'projects'),
  _NavItem(label: 'Skills', section: 'skills'),
  _NavItem(label: 'Contact', section: 'contact'),
];

class _NavItem {
  final String label;
  final String section;
  const _NavItem({required this.label, required this.section});
}

class NavBar extends StatefulWidget {
  final void Function(String section) onNavTap;

  const NavBar({super.key, required this.onNavTap});

  static double get height => _kNavHeight;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _menuOpen = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final txtPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final bgColor = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        return Container(
          decoration: BoxDecoration(
            color: bgColor.withValues(alpha: 0.95),
            border: Border(
              bottom: BorderSide(color: borderColor, width: 1),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: _kNavHeight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      // Logo
                      GestureDetector(
                        onTap: () => widget.onNavTap('home'),
                        child: Text(
                          'JCS',
                          style: GoogleFonts.spaceGrotesk(
                            color: AppColors.accentMode(context),
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      const Spacer(),
                      if (isMobile)
                        Row(
                          children: [
                            const LanguageSwitch(),
                            const SizedBox(width: 4),
                            const ThemeModeSwitch(),
                            IconButton(
                              icon: Icon(
                                _menuOpen ? Icons.close : Icons.menu,
                                color: txtPrimary,
                              ),
                              onPressed: () =>
                                  setState(() => _menuOpen = !_menuOpen),
                            ),
                          ],
                        )
                      else
                        Row(
                          children: [
                            ..._kNavItems
                                .map((item) => _DesktopNavButton(
                                      item: item,
                                      onTap: widget.onNavTap,
                                    )),
                            const SizedBox(width: 8),
                            const ThemeModeSwitch(),
                            const SizedBox(width: 4),
                            const LanguageSwitch(),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              if (isMobile && _menuOpen)
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: borderColor),
                    ),
                  ),
                  child: Column(
                    children: _kNavItems
                        .map(
                          (item) => InkWell(
                            onTap: () {
                              setState(() => _menuOpen = false);
                              widget.onNavTap(item.section);
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 14,
                              ),
                              child: Text(
                                item.label,
                                style: GoogleFonts.inter(
                                  color: txtPrimary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _DesktopNavButton extends StatefulWidget {
  final _NavItem item;
  final void Function(String) onTap;

  const _DesktopNavButton({required this.item, required this.onTap});

  @override
  State<_DesktopNavButton> createState() => _DesktopNavButtonState();
}

class _DesktopNavButtonState extends State<_DesktopNavButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final txtSecondary = isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () => widget.onTap(widget.item.section),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: _hovering
                ? AppColors.accentMode(context).withValues(alpha: 0.08)
                : Colors.transparent,
          ),
          child: Text(
            widget.item.label,
            style: GoogleFonts.inter(
              color: _hovering ? AppColors.accentMode(context) : txtSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
