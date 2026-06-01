import 'package:jaspr/jaspr.dart';
@Import.onWeb('dart:html', show: [#window])
import 'app.imports.dart';
import 'pages/home_page.dart';

@client
class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String _lang = 'pt';
  String _theme = 'dark';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    _handleRedirect();
  }

  void _handleRedirect() {
    if (kIsWeb) {
      if (window.location.pathname == '/') {
        window.history.replaceState(null, '', '/home');
      }
    }
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
      _theme = _theme == 'dark' ? 'light' : 'dark';
      if (kIsWeb) {
        window.localStorage['theme'] = _theme;
        _applyTheme();
      }
    });
  }

  void _toggleLanguage() {
    setState(() {
      _lang = _lang == 'pt' ? 'en' : 'pt';
      if (kIsWeb) {
        window.localStorage['lang'] = _lang;
      }
    });
  }

  @override
  Component build(BuildContext context) {
    return HomePage(
      lang: _lang,
      theme: _theme,
      toggleTheme: _toggleTheme,
      toggleLanguage: _toggleLanguage,
    );
  }
}
