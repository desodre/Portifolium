import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';

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
    final content = kContent[lang]!;
    return button(
      classes: 'lang-switch',
      events: {
        'click': (e) => toggleLanguage(),
      },
      attributes: {
        'type': 'button',
        'aria-label': content.langSwitchLabel,
        'title': content.langSwitchLabel,
      },
      [Component.text(lang.toUpperCase())],
    );
  }
}
