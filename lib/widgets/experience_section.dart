import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import 'section_title.dart';

class ExperienceSection extends StatelessComponent {
  final String lang;

  const ExperienceSection({super.key, required this.lang});

  @override
  Component build(BuildContext context) {
    final content = kContent[lang]!;
    final experiences = content.experiences;

    return div(classes: 'section-padding container-box', [
      SectionTitle(
        title: content.sectionExperience,
        subtitle: content.sectionExperienceSubtitle,
      ),
      div(classes: 'timeline-container', [
        for (var i = 0; i < experiences.length; i++)
          () {
            final entry = experiences[i];
            final isLast = i == experiences.length - 1;
            return div(classes: 'timeline-item', [
              // Marker Column (Dot and vertical connecting line)
              div(classes: 'timeline-marker', [
                div(classes: 'timeline-dot${entry.isCurrent ? ' current' : ''}', []),
                if (!isLast) div(classes: 'timeline-line', []),
              ]),
              // Content Card Column
              div(classes: 'timeline-content', [
                div(classes: 'experience-card', [
                  // Header (Role + Optional Current Badge)
                  div(classes: 'exp-header-wrap', [
                    h3(classes: 'exp-role', [Component.text(entry.role)]),
                    if (entry.isCurrent)
                      span(classes: 'exp-badge', [Component.text(lang == 'pt' ? 'Atual' : 'Current')]),
                  ]),
                  // Company & Period
                  div(classes: 'exp-meta-row', [
                    span(classes: 'exp-company', [Component.text(entry.company)]),
                    Component.text(' · '),
                    span(classes: 'exp-period', [Component.text(entry.period)]),
                  ]),
                  // Bullet points
                  ul(classes: 'exp-bullet-list', [
                    for (final bullet in entry.bullets)
                      li(classes: 'exp-bullet-item', [
                        div(classes: 'exp-bullet-dot', []),
                        span([Component.text(bullet)]),
                      ]),
                  ]),
                  // Tech chips
                  div(classes: 'tech-chips-wrap', [
                    for (final tech in entry.techs)
                      div(classes: 'tech-chip', [Component.text(tech)]),
                  ]),
                ]),
              ]),
            ]);
          }(),
      ]),
    ]);
  }
}
