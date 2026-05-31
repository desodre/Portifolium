import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class LanguageSwitch extends StatelessComponent {
  final String lang;
  final VoidCallback toggleLanguage;

  const LanguageSwitch({
    super.key,
    required this.lang,
    required this.toggleLanguage,
  });

  @override
  Component build(BuildContext context) {
    return button(
      classes: 'lang-switch',
      events: {
        'click': (e) => toggleLanguage(),
      },
      [Component.text(lang.toUpperCase())],
    );
  }
}
