import 'package:jaspr/jaspr.dart';
@Import.onWeb('dart:html', show: [#window])
import 'app.imports.dart';
import 'pages/home_page.dart';
import 'utils/web_utils.dart';

@client
class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String _lang = 'pt';
  String _theme = 'dark';
  final Set<String> _revealedSections = {};
  Unsubscribe? _unsubReveal;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    _unsubReveal = initRevealOnScroll();
  }

  @override
  void dispose() {
    _unsubReveal?.call();
    super.dispose();
  }

  void _loadPreferences() {
    if (kIsWeb) {
      final savedLang = window.localStorage['lang'];
      if (savedLang != null && (savedLang == 'pt' || savedLang == 'en')) {
        _lang = savedLang;
      }
      final savedTheme = window.localStorage['theme'];
      if (savedTheme != null &&
          (savedTheme == 'dark' || savedTheme == 'light')) {
        _theme = savedTheme;
      } else {
        // Fallback to system preference
        final systemDark =
            window.matchMedia('(prefers-color-scheme: dark)').matches;
        _theme = systemDark ? 'dark' : 'light';
      }
      _applyTheme();
    }
  }

  void _applyTheme() {
    if (kIsWeb) {
      window.document.documentElement?.setAttribute('data-theme', _theme);
    }
  }

  void _toggleTheme() {
    setState(() {
      _revealedSections.addAll(getRevealedSectionIds());
      _theme = _theme == 'dark' ? 'light' : 'dark';
      if (kIsWeb) {
        window.localStorage['theme'] = _theme;
        _applyTheme();
      }
    });
    Future.microtask(refreshRevealOnScroll);
  }

  void _toggleLanguage() {
    setState(() {
      _revealedSections.addAll(getRevealedSectionIds());
      _lang = _lang == 'pt' ? 'en' : 'pt';
      if (kIsWeb) {
        window.localStorage['lang'] = _lang;
      }
    });
    Future.microtask(refreshRevealOnScroll);
  }

  @override
  Component build(BuildContext context) {
    return HomePage(
      lang: _lang,
      theme: _theme,
      toggleTheme: _toggleTheme,
      toggleLanguage: _toggleLanguage,
      revealedSections: _revealedSections,
    );
  }
}
