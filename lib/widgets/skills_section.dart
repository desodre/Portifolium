import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import 'section_title.dart';

class SkillsSection extends StatefulComponent {
  final String lang;

  const SkillsSection({super.key, required this.lang});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  String _activeDomain = 'all';

  void _selectDomain(String domain) {
    if (_activeDomain != domain) {
      setState(() {
        _activeDomain = domain;
      });
    }
  }

  bool _matchesDomain(SkillCategory category) {
    return switch (_activeDomain) {
      'all' => true,
      'mobile' => category.domain == 'mobile' || category.domain == 'languages',
      'backend' =>
        category.domain == 'backend' || category.domain == 'languages',
      'quality' => category.domain == 'quality',
      'web' => category.domain == 'web',
      _ => true,
    };
  }

  @override
  Component build(BuildContext context) {
    final content = kContent[component.lang]!;
    final filters = [
      ('all', content.skillsFilterAll),
      ('mobile', content.skillsFilterMobile),
      ('backend', content.skillsFilterBackend),
      ('quality', content.skillsFilterQuality),
      ('web', content.skillsFilterWeb),
    ];
    final filteredCategories = content.skills.where(_matchesDomain).toList();

    return div(classes: 'section-padding container-box', [
      SectionTitle(
        title: content.sectionSkills,
        subtitle: content.sectionSkillsSubtitle,
      ),
      // Highlighted Core Stack
      div(classes: 'core-skills-card', [
        div(classes: 'core-skills-header', [
          div(classes: 'core-skills-title-row', [
            div(classes: 'skill-cat-indicator', []),
            h3(
              classes: 'core-skills-title',
              [Component.text(content.skillsCoreTitle)],
            ),
          ]),
          p(
            classes: 'core-skills-subtitle',
            [Component.text(content.skillsCoreSubtitle)],
          ),
        ]),
        div(classes: 'core-skills-wrap', [
          for (final skill in kCoreSkills)
            div(classes: 'core-skill-chip', [Component.text(skill)]),
        ]),
      ]),
      // Domain filter bar
      div(
        classes: 'skills-filter-bar',
        attributes: {
          'role': 'group',
          'aria-label': content.sectionSkills,
        },
        [
          for (final (key, label) in filters)
            button(
              classes:
                  'skills-filter-pill${_activeDomain == key ? ' active' : ''}',
              attributes: {
                'type': 'button',
                'aria-pressed': '${_activeDomain == key}',
              },
              events: {'click': (e) => _selectDomain(key)},
              [Component.text(label)],
            ),
        ],
      ),
      // Filtered skill categories
      div(classes: 'skills-wrap', [
        for (final cat in filteredCategories)
          div(classes: 'skill-category-card', [
            div(classes: 'skill-cat-header', [
              div(classes: 'skill-cat-indicator', []),
              h3(classes: 'skill-cat-label', [Component.text(cat.label)]),
              div(classes: 'nav-spacer', []),
              span(
                classes: 'skill-cat-count',
                [Component.text('${cat.skills.length}')],
              ),
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
