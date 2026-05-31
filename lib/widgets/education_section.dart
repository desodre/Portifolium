import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import 'section_title.dart';

class EducationSection extends StatelessComponent {
  final String lang;

  const EducationSection({super.key, required this.lang});

  @override
  Component build(BuildContext context) {
    final content = kContent[lang]!;

    return div(classes: 'surface-bg', [
      div(classes: 'section-padding container-box', [
        // Section Title
        SectionTitle(
          title: content.sectionEducation,
          subtitle: content.sectionEducationSubtitle,
        ),
        
        // Education Cards Wrap
        div(classes: 'edu-cards-wrap', [
          for (final edu in content.education)
            div(classes: 'education-card', [
              div(classes: 'edu-icon-container', [
                span(classes: 'material-symbols-outlined icon', [Component.text('school')]),
              ]),
              div(classes: 'edu-info-container', [
                h4(classes: 'edu-degree', [Component.text(edu.degree)]),
                span(classes: 'edu-institution', [Component.text(edu.institution)]),
                span(classes: 'edu-period', [Component.text(edu.period)]),
                if (edu.note != null)
                  span(classes: 'edu-note', [Component.text(edu.note!)]),
              ]),
            ]),
        ]),

        // Courses Block
        div(classes: 'edu-sub-block', [
          div(classes: 'sub-block-title-row', [
            div(classes: 'sub-block-indicator', []),
            h3(classes: 'sub-block-title', [Component.text(content.coursesHeading)]),
          ]),
          div(classes: 'courses-wrap', [
            for (final course in content.courses)
              div(classes: 'course-chip-card', [
                span(classes: 'material-symbols-outlined icon', [Component.text('verified')]),
                div(classes: 'course-info', [
                  span(classes: 'course-title', [Component.text(course.title)]),
                  span(classes: 'course-meta', [Component.text('${course.provider} · ${course.year}')]),
                ]),
              ]),
          ]),
        ]),

        // Languages Block
        div(classes: 'edu-sub-block', [
          div(classes: 'sub-block-title-row', [
            div(classes: 'sub-block-indicator', []),
            h3(classes: 'sub-block-title', [Component.text(content.spokenLanguagesHeading)]),
          ]),
          div(classes: 'languages-wrap', [
            for (final language in content.languages)
              div(classes: 'lang-chip-card', [
                span(classes: 'material-symbols-outlined icon', [Component.text('language')]),
                span(classes: 'lang-name', [Component.text(language['name']!)]),
                span(classes: 'lang-level', [Component.text('· ${language['level']!}')]),
              ]),
          ]),
        ]),
      ]),
    ]);
  }
}
