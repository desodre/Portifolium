import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import 'section_title.dart';

class ProjectsSection extends StatelessComponent {
  final String lang;

  const ProjectsSection({super.key, required this.lang});

  @override
  Component build(BuildContext context) {
    final content = kContent[lang]!;

    return div(classes: 'surface-bg', [
      div(classes: 'section-padding container-box', [
        SectionTitle(
          title: content.sectionProjects,
          subtitle: content.sectionProjectsSubtitle,
        ),
        div(classes: 'projects-grid', [
          for (final proj in content.projects)
            a(
              href: proj.url,
              target: Target.blank,
              classes: 'project-card',
              [
                // Card Header (Folder and link-out indicators)
                div(classes: 'proj-header', [
                  div(classes: 'proj-icon-wrapper', [
                    span(
                        classes: 'material-symbols-outlined icon',
                        [Component.text('folder')]),
                  ]),
                  div(classes: 'nav-spacer', []),
                  div(classes: 'proj-open-icon', [
                    span(
                        classes: 'material-symbols-outlined icon',
                        [Component.text('open_in_new')]),
                  ]),
                ]),

                // Project Title
                h3(classes: 'proj-title', [Component.text(proj.name)]),

                // Description
                p(classes: 'proj-desc', [Component.text(proj.description)]),

                // Tech tags
                div(classes: 'tech-chips-wrap', [
                  for (final tech in proj.techs)
                    div(classes: 'small-chip', [Component.text(tech)]),
                ]),
              ],
            ),
        ]),
      ]),
    ]);
  }
}
