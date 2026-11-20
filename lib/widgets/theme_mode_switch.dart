import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';

class ThemeModeSwitch extends StatelessComponent {
  final String theme;
  final VoidCallback toggleTheme;
  final String lang;

  const ThemeModeSwitch({
    super.key,
    required this.theme,
    required this.toggleTheme,
    this.lang = 'pt',
  });

  @override
  Component build(BuildContext context) {
    final isDark = theme == 'dark';
    final content = kContent[lang]!;
    final label = isDark ? content.themeToLightLabel : content.themeToDarkLabel;
    return button(
      classes: 'theme-switch',
      events: {
        'click': (e) => toggleTheme(),
      },
      attributes: {
        'type': 'button',
        'title': label,
        'aria-label': label,
      },
      [
        span(
          classes: 'material-symbols-outlined',
          attributes: {'aria-hidden': 'true'},
          [Component.text(isDark ? 'light_mode' : 'dark_mode')],
        ),
      ],
    );
  }
}
