import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class SectionTitle extends StatelessComponent {
  final String title;
  final String? subtitle;

  const SectionTitle({super.key, required this.title, this.subtitle});

  @override
  Component build(BuildContext context) {
    return div(classes: 'section-header-block', [
      div(classes: 'section-title-row', [
        div(classes: 'section-title-bar', []),
        h2(classes: 'section-title-text', [Component.text(title)]),
      ]),
      if (subtitle != null)
        p(classes: 'section-subtitle-text', [Component.text(subtitle!)]),
    ]);
  }
}
