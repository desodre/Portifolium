import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
@Import.onWeb('dart:html', show: [#window])
import 'nav_bar.imports.dart';
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
  {'label_en': 'Skills', 'label_pt': 'Habilidades', 'section': 'skills'},
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

  @override
  Component build(BuildContext context) {
    final isPt = component.lang == 'pt';
    return header(classes: 'nav-header', [
      div(classes: 'nav-container', [
        // Logo
        a(
          href: '#home',
          classes: 'nav-logo',
          events: {
            'click': (e) {
              _closeMenu();
              if (kIsWeb) {
                e.preventDefault();
                window.document.getElementById('home')?.scrollIntoView();
              }
            }
          },
          [Component.text('JCS')],
        ),
        div(classes: 'nav-spacer', []),

        // Desktop nav items
        div(classes: 'nav-items-desktop', [
          ..._kNavItems.map((item) {
            final label = isPt ? item['label_pt']! : item['label_en']!;
            final sectionId = item['section']!;
            return a(
              href: '#$sectionId',
              classes: 'nav-link',
              events: {
                'click': (e) {
                  if (kIsWeb) {
                    e.preventDefault();
                    window.document.getElementById(sectionId)?.scrollIntoView();
                  }
                }
              },
              [Component.text(label)],
            );
          }),
          ThemeModeSwitch(
              theme: component.theme, toggleTheme: component.toggleTheme),
          LanguageSwitch(
              lang: component.lang, toggleLanguage: component.toggleLanguage),
        ]),

        // Mobile actions
        div(classes: 'nav-actions-mobile', [
          LanguageSwitch(
              lang: component.lang, toggleLanguage: component.toggleLanguage),
          ThemeModeSwitch(
              theme: component.theme, toggleTheme: component.toggleTheme),
          button(
            classes: 'theme-switch',
            events: {'click': (e) => _toggleMenu()},
            [
              span(
                classes: 'material-symbols-outlined',
                [Component.text(_menuOpen ? 'close' : 'menu')],
              ),
            ],
          ),
        ]),
      ]),

      // Mobile dropdown menu
      div(
        classes: 'nav-mobile-menu${_menuOpen ? ' open' : ''}',
        [
          ..._kNavItems.map((item) {
            final label = isPt ? item['label_pt']! : item['label_en']!;
            final sectionId = item['section']!;
            return a(
              href: '#$sectionId',
              classes: 'nav-link-mobile',
              events: {
                'click': (e) {
                  _closeMenu();
                  if (kIsWeb) {
                    e.preventDefault();
                    window.document.getElementById(sectionId)?.scrollIntoView();
                  }
                }
              },
              [Component.text(label)],
            );
          }),
        ],
      ),
    ]);
  }
}
