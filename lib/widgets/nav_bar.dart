import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import '../utils/web_utils.dart';
import 'language_switch.dart';
import 'theme_mode_switch.dart';

const List<Map<String, String>> _kNavItems = [
  {'label_en': 'Home', 'label_pt': 'Início', 'section': 'home'},
  {
    'label_en': 'Experience',
    'label_pt': 'Experiência',
    'section': 'experience'
  },
  {'label_en': 'Projects', 'label_pt': 'Projetos', 'section': 'projects'},
  {'label_en': 'Apps', 'label_pt': 'Apps', 'section': 'apps'},
  {'label_en': 'Skills', 'label_pt': 'Habilidades', 'section': 'skills'},
  {'label_en': 'Education', 'label_pt': 'Formação', 'section': 'education'},
  {'label_en': 'Contact', 'label_pt': 'Contato', 'section': 'contact'},
];

class NavBar extends StatefulComponent {
  final String lang;
  final String theme;
  final VoidCallback toggleTheme;
  final VoidCallback toggleLanguage;

  const NavBar({
    super.key,
    required this.lang,
    required this.theme,
    required this.toggleTheme,
    required this.toggleLanguage,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _menuOpen = false;
  bool _isScrolled = false;
  String _activeSection = 'home';
  double _scrollProgress = 0.0;
  Unsubscribe? _unsubScroll;
  Unsubscribe? _unsubEsc;

  @override
  void initState() {
    super.initState();
    _unsubScroll = subscribeScrollSpy(
      [
        'home',
        'experience',
        'projects',
        'apps',
        'skills',
        'education',
        'contact',
      ],
      (activeId, progress) {
        if (!mounted) return;
        final nextScrolled = progress > 0.01;
        if (_activeSection != activeId ||
            _isScrolled != nextScrolled ||
            (_scrollProgress - progress).abs() > 0.005) {
          setState(() {
            _activeSection = activeId;
            _isScrolled = nextScrolled;
            _scrollProgress = progress;
          });
        }
      },
    );
    _unsubEsc = subscribeEscapeKey(_closeMenu);
  }

  @override
  void dispose() {
    _unsubScroll?.call();
    _unsubEsc?.call();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _menuOpen = !_menuOpen;
    });
  }

  void _closeMenu() {
    if (_menuOpen) {
      setState(() {
        _menuOpen = false;
      });
    }
  }

  Component _buildNavLink(
    Map<String, String> item, {
    required bool isPt,
    required bool mobile,
  }) {
    final label = isPt ? item['label_pt']! : item['label_en']!;
    final sectionId = item['section']!;
    final isActive = _activeSection == sectionId;
    final baseClass = mobile ? 'nav-link-mobile' : 'nav-link';
    final attrs = <String, String>{
      if (isActive) 'aria-current': 'location',
      if (mobile && !_menuOpen) 'tabindex': '-1',
    };
    return a(
      href: '#$sectionId',
      classes: '$baseClass${isActive ? ' active' : ''}',
      attributes: attrs.isEmpty ? null : attrs,
      events: {
        'click': (e) {
          e.preventDefault();
          if (mobile) _closeMenu();
          scrollToSection(sectionId);
        },
      },
      [Component.text(label)],
    );
  }

  @override
  Component build(BuildContext context) {
    final isPt = component.lang == 'pt';
    final content = kContent[component.lang]!;

    return div(classes: 'nav-root', [
      header(classes: 'nav-header${_isScrolled ? ' scrolled' : ''}', [
        div(classes: 'nav-container', [
          // Wordmark
          div(classes: 'nav-brand', [
            a(
              href: '#home',
              classes: 'brand-link',
              events: {
                'click': (e) {
                  e.preventDefault();
                  _closeMenu();
                  scrollToSection('home');
                }
              },
              [Component.text('Jhonatha Sodre')],
            ),
          ]),
          div(classes: 'nav-spacer', []),

          // Desktop nav items
          nav(
            classes: 'nav-items-desktop',
            attributes: {'aria-label': content.navAriaLabel},
            [
              for (final item in _kNavItems)
                _buildNavLink(item, isPt: isPt, mobile: false),
              ThemeModeSwitch(
                theme: component.theme,
                toggleTheme: component.toggleTheme,
                lang: component.lang,
              ),
              LanguageSwitch(
                lang: component.lang,
                toggleLanguage: component.toggleLanguage,
              ),
            ],
          ),

          // Mobile actions
          div(classes: 'nav-actions-mobile', [
            LanguageSwitch(
              lang: component.lang,
              toggleLanguage: component.toggleLanguage,
            ),
            ThemeModeSwitch(
              theme: component.theme,
              toggleTheme: component.toggleTheme,
              lang: component.lang,
            ),
            button(
              classes: 'theme-switch',
              attributes: {
                'type': 'button',
                'aria-label': _menuOpen
                    ? content.navMenuCloseLabel
                    : content.navMenuOpenLabel,
                'aria-expanded': '$_menuOpen',
                'aria-controls': 'mobile-nav-menu',
              },
              events: {'click': (e) => _toggleMenu()},
              [
                span(
                  classes: 'material-symbols-outlined',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text(_menuOpen ? 'close' : 'menu')],
                ),
              ],
            ),
          ]),
        ]),

        // Reading progress indicator
        div(
          classes: 'nav-progress nav-progress-track',
          attributes: {'aria-hidden': 'true'},
          [
            div(
              classes: 'nav-progress-bar',
              styles: Styles(raw: {
                'width': '${(_scrollProgress * 100).toStringAsFixed(1)}%',
              }),
              [],
            ),
          ],
        ),
      ]),

      // Clickable backdrop & mobile drawer outside header backdrop-filter block
      if (_menuOpen)
        div(
          classes: 'nav-mobile-backdrop',
          attributes: {'aria-hidden': 'true'},
          events: {'click': (_) => _closeMenu()},
          [],
        ),

      nav(
        id: 'mobile-nav-menu',
        classes: 'nav-mobile-menu${_menuOpen ? ' open' : ''}',
        attributes: {
          'aria-label': content.navAriaLabel,
          'aria-hidden': '${!_menuOpen}',
          if (!_menuOpen) 'inert': '',
        },
        [
          for (final item in _kNavItems)
            _buildNavLink(item, isPt: isPt, mobile: true),
        ],
      ),
    ]);
  }
}
