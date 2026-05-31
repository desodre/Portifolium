import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class ThemeModeSwitch extends StatelessComponent {
  final String theme;
  final VoidCallback toggleTheme;

  const ThemeModeSwitch({
    super.key,
    required this.theme,
    required this.toggleTheme,
  });

  @override
  Component build(BuildContext context) {
    final isDark = theme == 'dark';
    return button(
      classes: 'theme-switch',
      events: {
        'click': (e) => toggleTheme(),
      },
      attributes: {'title': 'Toggle Theme'},
      [
        span(
          classes: 'material-symbols-outlined',
          [Component.text(isDark ? 'light_mode' : 'dark_mode')],
        ),
      ],
    );
  }
}
