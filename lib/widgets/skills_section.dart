import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import 'section_title.dart';

class SkillsSection extends StatelessComponent {
  final String lang;

  const SkillsSection({super.key, required this.lang});

  @override
  Component build(BuildContext context) {
    final content = kContent[lang]!;

    return div(classes: 'section-padding container-box', [
      SectionTitle(
        title: content.sectionSkills,
        subtitle: content.sectionSkillsSubtitle,
      ),
      div(classes: 'skills-wrap', [
        for (final cat in content.skills)
          div(classes: 'skill-category-card', [
            div(classes: 'skill-cat-header', [
              div(classes: 'skill-cat-indicator', []),
              h3(classes: 'skill-cat-label', [Component.text(cat.label)]),
            ]),
            div(classes: 'skill-chips-wrap', [
              for (final skill in cat.skills)
                div(classes: 'skill-chip', [Component.text(skill)]),
            ]),
          ]),
      ]),
    ]);
  }
}
