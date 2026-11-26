import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class SectionTitle extends StatelessComponent {
  final String title;
  final String? subtitle;
  final String? indexTag;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.indexTag,
  });

  @override
  Component build(BuildContext context) {
    final cleanIndex = indexTag?.replaceAll('/', '').trim();

    return div(classes: 'section-header-block', [
      if (cleanIndex != null && cleanIndex.isNotEmpty)
        div(
          classes: 'section-eyebrow',
          attributes: {'aria-hidden': 'true'},
          [
            span(
              classes: 'section-index-tag',
              [Component.text(cleanIndex)],
            ),
            div(classes: 'section-eyebrow-rule', []),
          ],
        ),
      div(classes: 'section-title-row', [
        h2(classes: 'section-title-text', [Component.text(title)]),
      ]),
      if (subtitle != null)
        p(classes: 'section-subtitle-text', [Component.text(subtitle!)]),
    ]);
  }
}
