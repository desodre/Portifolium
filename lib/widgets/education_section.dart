import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import 'section_title.dart';

class EducationSection extends StatelessComponent {
  final String lang;

  const EducationSection({super.key, required this.lang});

  static int _proficiencyLevel(String level) {
    final lower = level.toLowerCase();
    if (lower.contains('nativ')) return 4;
    if (lower.contains('advanc') || lower.contains('avanç')) return 3;
    if (lower.contains('inter')) return 2;
    return 1;
  }

  @override
  Component build(BuildContext context) {
    final content = kContent[lang]!;

    return div(classes: 'section-padding container-box', [
      // Section Title
      SectionTitle(
        title: content.sectionEducation,
        subtitle: content.sectionEducationSubtitle,
        indexTag: '06',
      ),

      // Education Rows
      div(classes: 'edu-cards-wrap', [
        for (final edu in content.education)
          div(classes: 'education-card', [
            div(classes: 'edu-info-container', [
              h3(classes: 'edu-degree', [Component.text(edu.degree)]),
              span(
                classes: 'edu-institution',
                [Component.text(edu.institution)],
              ),
              if (edu.note != null)
                span(classes: 'edu-note', [Component.text(edu.note!)]),
            ]),
            span(classes: 'edu-period', [Component.text(edu.period)]),
          ]),
      ]),

      // Courses & Languages 2-Column Split
      div(classes: 'edu-bottom-grid', [
        // Courses Block
        div(classes: 'edu-sub-block', [
          div(classes: 'sub-block-title-row', [
            h3(
              classes: 'sub-block-title',
              [Component.text(content.coursesHeading)],
            ),
          ]),
          div(classes: 'courses-wrap', [
            for (final course in content.courses)
              div(classes: 'course-chip-card', [
                div(classes: 'course-info', [
                  span(classes: 'course-title', [Component.text(course.title)]),
                  span(
                    classes: 'course-meta',
                    [Component.text('${course.provider} · ${course.year}')],
                  ),
                ]),
              ]),
          ]),
        ]),

        // Languages Block
        div(classes: 'edu-sub-block', [
          div(classes: 'sub-block-title-row', [
            h3(
              classes: 'sub-block-title',
              [Component.text(content.spokenLanguagesHeading)],
            ),
          ]),
          div(classes: 'languages-wrap', [
            for (final language in content.languages)
              () {
                final level = language['level']!;
                final score = _proficiencyLevel(level);
                return div(classes: 'lang-chip-card', [
                  span(
                    classes: 'lang-name',
                    [Component.text(language['name']!)],
                  ),
                  span(
                    classes: 'lang-level',
                    [Component.text('· $level')],
                  ),
                  div(
                    classes: 'lang-proficiency-bars',
                    attributes: {'aria-hidden': 'true'},
                    [
                      for (var b = 1; b <= 4; b++)
                        span(
                          classes: 'lang-bar${b <= score ? ' filled' : ''}',
                          [],
                        ),
                    ],
                  ),
                ]);
              }(),
          ]),
        ]),
      ]),
    ]);
  }
}
