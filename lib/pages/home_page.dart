import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import '../widgets/nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/published_apps_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/contribution_graph_section.dart';
import '../widgets/education_section.dart';
import '../widgets/contact_section.dart';

class HomePage extends StatelessComponent {
  final String lang;
  final String theme;
  final VoidCallback toggleTheme;
  final VoidCallback toggleLanguage;
  final Set<String> revealedSections;

  const HomePage({
    super.key,
    required this.lang,
    required this.theme,
    required this.toggleTheme,
    required this.toggleLanguage,
    this.revealedSections = const {},
  });

  @override
  Component build(BuildContext context) {
    final content = kContent[lang]!;

    return div(classes: 'page-shell', [
      a(
        href: '#main-content',
        classes: 'skip-link',
        [Component.text(content.skipToContent)],
      ),

      // NavBar floating header overlay
      NavBar(
        lang: lang,
        theme: theme,
        toggleTheme: toggleTheme,
        toggleLanguage: toggleLanguage,
      ),

      // Main container with offset for fixed navigation bar
      main_(
        id: 'main-content',
        classes: 'main-content',
        [
          div(
            classes: 'print-contact-header',
            [
              h1(classes: 'print-name', [Component.text(kName)]),
              p(classes: 'print-title', [Component.text(content.title)]),
              p(classes: 'print-meta', [
                Component.text(
                  '$kLocation  ·  $kEmail  ·  $kPhone  ·  github.com/desodre  ·  linkedin.com/in/jhonsodre',
                ),
              ]),
            ],
          ),
          section(
            id: 'home',
            attributes: {'aria-label': lang == 'pt' ? 'Início' : 'Home'},
            [
              HeroSection(lang: lang),
            ],
          ),
          section(
            id: 'experience',
            classes: revealedSections.contains('experience') ? 'is-revealed' : null,
            attributes: {
              'aria-label': content.sectionExperience,
              'data-reveal': 'section',
            },
            [
              ExperienceSection(lang: lang),
            ],
          ),
          section(
            id: 'projects',
            classes: revealedSections.contains('projects') ? 'is-revealed' : null,
            attributes: {
              'aria-label': content.sectionProjects,
              'data-reveal': 'section',
            },
            [
              ProjectsSection(lang: lang),
            ],
          ),
          section(
            id: 'apps',
            classes: revealedSections.contains('apps') ? 'is-revealed' : null,
            attributes: {
              'aria-label': content.sectionPublishedApps,
              'data-reveal': 'section',
            },
            [
              PublishedAppsSection(lang: lang),
            ],
          ),
          section(
            id: 'skills',
            classes: revealedSections.contains('skills') ? 'is-revealed' : null,
            attributes: {
              'aria-label': content.sectionSkills,
              'data-reveal': 'section',
            },
            [
              SkillsSection(lang: lang),
            ],
          ),
          section(
            id: 'contributions',
            classes:
                revealedSections.contains('contributions') ? 'is-revealed' : null,
            attributes: {
              'aria-label': content.sectionContributions,
              'data-reveal': 'section',
            },
            [
              ContributionGraphSection(lang: lang),
            ],
          ),
          section(
            id: 'education',
            classes: revealedSections.contains('education') ? 'is-revealed' : null,
            attributes: {
              'aria-label': content.sectionEducation,
              'data-reveal': 'section',
            },
            [
              EducationSection(lang: lang),
            ],
          ),
          section(
            id: 'contact',
            classes: revealedSections.contains('contact') ? 'is-revealed' : null,
            attributes: {
              'aria-label': content.sectionContact,
              'data-reveal': 'section',
            },
            [
              ContactSection(lang: lang),
            ],
          ),
        ],
      ),
    ]);
  }
}
