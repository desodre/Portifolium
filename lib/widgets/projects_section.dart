import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import '../utils/web_utils.dart';
import 'section_title.dart';

class ProjectsSection extends StatefulComponent {
  final String lang;

  const ProjectsSection({super.key, required this.lang});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _selectedFilter = 'all';
  String? _activeCaseStudyName;
  Unsubscribe? _unsubEsc;

  @override
  void initState() {
    super.initState();
    _unsubEsc = subscribeEscapeKey(_closeCaseStudy);
  }

  @override
  void dispose() {
    _unsubEsc?.call();
    super.dispose();
  }

  void _openCaseStudy(String projectName) {
    setState(() => _activeCaseStudyName = projectName);
  }

  void _closeCaseStudy() {
    if (_activeCaseStudyName != null && mounted) {
      setState(() => _activeCaseStudyName = null);
    }
  }

  bool _matchesFilter(ProjectEntry proj) {
    if (_selectedFilter == 'all') return true;
    final lowerTechs = proj.techs.map((t) => t.toLowerCase()).toList();
    switch (_selectedFilter) {
      case 'android':
        return lowerTechs.any((t) =>
            t.contains('android') ||
            t.contains('kotlin') ||
            t.contains('adb') ||
            t.contains('binder'));
      case 'flutter':
        return lowerTechs.any((t) => t.contains('flutter'));
      case 'python':
        return lowerTechs.any((t) => t.contains('python'));
      case 'rust':
        return lowerTechs.any((t) => t.contains('rust'));
      default:
        return true;
    }
  }

  Component _buildCaseStudyModal(
    ProjectEntry activeProject,
    PortfolioContent content,
  ) {
    final cs = activeProject.caseStudy!;
    return div(
      classes: 'case-study-backdrop',
      attributes: {
        'role': 'dialog',
        'aria-modal': 'true',
        'aria-labelledby': 'case-study-title',
      },
      events: {'click': (_) => _closeCaseStudy()},
      [
        div(
          classes: 'case-study-dialog',
          events: {'click': (e) => e.stopPropagation()},
          [
            div(classes: 'case-study-header', [
              div(classes: 'case-study-title-wrap', [
                div(classes: 'proj-icon-wrapper', [
                  span(
                    classes: 'material-symbols-outlined icon',
                    attributes: {'aria-hidden': 'true'},
                    [Component.text(activeProject.icon)],
                  ),
                ]),
                div([
                  h3(
                    id: 'case-study-title',
                    classes: 'case-study-title',
                    [Component.text(activeProject.name)],
                  ),
                  span(
                    classes: 'case-study-role-badge',
                    [Component.text('${content.caseStudyRoleLabel}: ${cs.role}')],
                  ),
                ]),
              ]),
              button(
                classes: 'lightbox-close-btn',
                attributes: {
                  'type': 'button',
                  'aria-label': content.caseStudyCloseLabel,
                },
                events: {'click': (_) => _closeCaseStudy()},
                [
                  span(
                    classes: 'material-symbols-outlined',
                    attributes: {'aria-hidden': 'true'},
                    [Component.text('close')],
                  ),
                ],
              ),
            ]),
            div(classes: 'case-study-body', [
              p(
                classes: 'case-study-summary',
                [Component.text(activeProject.description)],
              ),
              div(classes: 'case-study-block', [
                h4(
                  classes: 'case-study-heading',
                  [Component.text(content.caseStudyProblemLabel)],
                ),
                p(
                  classes: 'case-study-text',
                  [Component.text(cs.problem)],
                ),
              ]),
              div(classes: 'case-study-block', [
                h4(
                  classes: 'case-study-heading',
                  [Component.text(content.caseStudyArchitectureLabel)],
                ),
                p(
                  classes: 'case-study-text',
                  [Component.text(cs.architecture)],
                ),
              ]),
              div(classes: 'case-study-block', [
                h4(
                  classes: 'case-study-heading',
                  [Component.text(content.caseStudyHighlightsLabel)],
                ),
                ul(classes: 'case-study-highlights', [
                  for (final item in cs.highlights)
                    li(classes: 'case-study-highlight-item', [
                      div(classes: 'exp-bullet-dot', []),
                      span([Component.text(item)]),
                    ]),
                ]),
              ]),
              div(classes: 'case-study-block', [
                h4(
                  classes: 'case-study-heading',
                  [Component.text(content.caseStudyStackLabel)],
                ),
                div(classes: 'tech-chips-wrap', [
                  for (final tech in activeProject.techs)
                    div(classes: 'tech-chip', [Component.text(tech)]),
                ]),
              ]),
            ]),
            div(classes: 'case-study-footer', [
              a(
                href: activeProject.url,
                target: Target.blank,
                classes: 'btn-primary case-study-cta',
                attributes: {'rel': 'noopener noreferrer'},
                [
                  Component.text(content.projOpenRepo),
                  span(
                    classes: 'material-symbols-outlined icon',
                    attributes: {'aria-hidden': 'true'},
                    [Component.text('open_in_new')],
                  ),
                ],
              ),
              button(
                classes: 'btn-secondary',
                attributes: {'type': 'button'},
                events: {'click': (_) => _closeCaseStudy()},
                [Component.text(content.caseStudyCloseLabel)],
              ),
            ]),
          ],
        ),
      ],
    );
  }

  @override
  Component build(BuildContext context) {
    final content = kContent[component.lang]!;
    final filters = [
      ('all', content.projectsFilterAll),
      ('android', 'Android / Kotlin'),
      ('flutter', 'Flutter'),
      ('python', 'Python'),
      ('rust', 'Rust'),
    ];
    final filteredProjects = content.projects.where(_matchesFilter).toList();

    ProjectEntry? activeProject;
    if (_activeCaseStudyName != null) {
      for (final p in content.projects) {
        if (p.name == _activeCaseStudyName && p.caseStudy != null) {
          activeProject = p;
          break;
        }
      }
    }

    return div(classes: 'surface-bg', [
      div(classes: 'section-padding container-box', [
        SectionTitle(
          title: content.sectionProjects,
          subtitle: content.sectionProjectsSubtitle,
        ),
        div(
          classes: 'filter-pills-row',
          attributes: {'role': 'group', 'aria-label': content.sectionProjects},
          [
            for (final (id, label) in filters)
              () {
                final isActive = _selectedFilter == id;
                return button(
                  classes: 'filter-pill${isActive ? ' active' : ''}',
                  attributes: {
                    'type': 'button',
                    'aria-pressed': '$isActive',
                  },
                  events: {
                    'click': (_) {
                      if (_selectedFilter != id) {
                        setState(() => _selectedFilter = id);
                      }
                    },
                  },
                  [Component.text(label)],
                );
              }(),
          ],
        ),
        div(classes: 'projects-grid', [
          for (final proj in filteredProjects)
            article(
              classes: 'project-card${proj.isFeatured ? ' featured' : ''}',
              [
                // Card Header (Category icon, featured badge, and link-out indicator)
                div(classes: 'proj-header', [
                  div(classes: 'proj-icon-wrapper', [
                    span(
                      classes: 'material-symbols-outlined icon',
                      attributes: {'aria-hidden': 'true'},
                      [Component.text(proj.icon)],
                    ),
                  ]),
                  if (proj.isFeatured)
                    span(
                      classes: 'proj-featured-badge',
                      [Component.text(content.projectsFeaturedBadge)],
                    ),
                  div(classes: 'nav-spacer', []),
                  a(
                    href: proj.url,
                    target: Target.blank,
                    classes: 'proj-open-icon',
                    attributes: {
                      'rel': 'noopener noreferrer',
                      'aria-label': '${proj.name} — ${content.projOpenRepo}',
                    },
                    [
                      span(
                        classes: 'material-symbols-outlined icon',
                        attributes: {'aria-hidden': 'true'},
                        [Component.text('open_in_new')],
                      ),
                    ],
                  ),
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

                // Card Actions (Case Study modal trigger & Repository link)
                div(classes: 'proj-card-actions', [
                  if (proj.caseStudy != null)
                    button(
                      classes: 'proj-case-btn',
                      attributes: {
                        'type': 'button',
                        'aria-label': '${content.projViewCaseStudy}: ${proj.name}',
                      },
                      events: {'click': (_) => _openCaseStudy(proj.name)},
                      [
                        span(
                          classes: 'material-symbols-outlined icon',
                          attributes: {'aria-hidden': 'true'},
                          [Component.text('architecture')],
                        ),
                        Component.text(content.projViewCaseStudy),
                      ],
                    ),
                  a(
                    href: proj.url,
                    target: Target.blank,
                    classes: 'proj-repo-link',
                    attributes: {'rel': 'noopener noreferrer'},
                    [
                      Component.text(content.projOpenRepo),
                      span(
                        classes: 'material-symbols-outlined icon',
                        attributes: {'aria-hidden': 'true'},
                        [Component.text('open_in_new')],
                      ),
                    ],
                  ),
                ]),
              ],
            ),
        ]),
      ]),
      if (activeProject != null) _buildCaseStudyModal(activeProject, content),
    ]);
  }
}
