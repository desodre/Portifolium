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
  String _searchQuery = '';

  void _selectDomain(String domain) {
    if (_activeDomain != domain) {
      setState(() {
        _activeDomain = domain;
      });
    }
  }

  void _resetFilters() {
    setState(() {
      _activeDomain = 'all';
      _searchQuery = '';
    });
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

    final query = _searchQuery.trim().toLowerCase();
    final filteredCategories = <SkillCategory>[];
    for (final cat in content.skills) {
      if (!_matchesDomain(cat)) continue;
      if (query.isEmpty) {
        filteredCategories.add(cat);
      } else {
        final matchingSkills = cat.skills
            .where((s) => s.toLowerCase().contains(query))
            .toList();
        if (matchingSkills.isNotEmpty) {
          filteredCategories.add(SkillCategory(
            label: cat.label,
            domain: cat.domain,
            skills: matchingSkills,
            icon: cat.icon,
          ));
        }
      }
    }

    return div(classes: 'section-padding container-box', [
      SectionTitle(
        title: content.sectionSkills,
        subtitle: content.sectionSkillsSubtitle,
        indexTag: '04',
      ),
      // Highlighted Core Stack
      div(classes: 'core-skills-card', [
        div(classes: 'core-skills-header', [
          div(classes: 'core-skills-title-row', [
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
      // Search + Domain Filter Toolbar
      div(classes: 'skills-toolbar', [
        div(classes: 'skills-search-box', [
          label(
            htmlFor: 'skills-search-input',
            classes: 'sr-only',
            [
              Component.text(
                component.lang == 'pt'
                    ? 'Buscar habilidades e tecnologias'
                    : 'Search skills and technologies',
              ),
            ],
          ),
          span(
            classes: 'material-symbols-outlined skills-search-icon',
            attributes: {'aria-hidden': 'true'},
            [Component.text('search')],
          ),
          input<String>(
            id: 'skills-search-input',
            type: InputType.text,
            value: _searchQuery,
            classes: 'skills-search-input',
            attributes: {
              'placeholder': content.skillsSearchPlaceholder,
            },
            onInput: (val) => setState(() => _searchQuery = val),
          ),
          if (_searchQuery.isNotEmpty)
            button(
              classes: 'skills-search-clear',
              attributes: {
                'type': 'button',
                'aria-label': content.skillsResetFilter,
              },
              events: {'click': (_) => setState(() => _searchQuery = '')},
              [
                span(
                  classes: 'material-symbols-outlined',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text('close')],
                ),
              ],
            ),
        ]),
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
      ]),
      // Filtered skill categories or Empty State
      if (filteredCategories.isEmpty)
        div(
          classes: 'skills-empty-state',
          attributes: {'role': 'status', 'aria-live': 'polite'},
          [
          span(
            classes: 'material-symbols-outlined skills-empty-icon',
            attributes: {'aria-hidden': 'true'},
            [Component.text('search_off')],
          ),
          p(
            classes: 'skills-empty-text',
            [Component.text(content.skillsNoMatch)],
          ),
          button(
            classes: 'btn-secondary',
            attributes: {'type': 'button'},
            events: {'click': (_) => _resetFilters()},
            [Component.text(content.skillsResetFilter)],
          ),
        ])
      else
        div(classes: 'skills-wrap', [
          for (final cat in filteredCategories)
            div(classes: 'skill-category-card', [
              div(classes: 'skill-cat-header', [
                div(classes: 'skill-cat-title-group', [
                  h3(classes: 'skill-cat-label', [Component.text(cat.label)]),
                ]),
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
