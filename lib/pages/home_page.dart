import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
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

  const HomePage({
    super.key,
    required this.lang,
    required this.theme,
    required this.toggleTheme,
    required this.toggleLanguage,
  });

  @override
  Component build(BuildContext context) {
    return div([
      // NavBar floating header overlay
      NavBar(
        lang: lang,
        theme: theme,
        toggleTheme: toggleTheme,
        toggleLanguage: toggleLanguage,
      ),

      // Main container with offset for fixed navigation bar
      div(
        styles: Styles(raw: {
          'margin-top': '64px',
        }),
        [
          section(id: 'home', [
            HeroSection(lang: lang),
          ]),
          section(id: 'experience', [
            ExperienceSection(lang: lang),
          ]),
          section(id: 'projects', [
            ProjectsSection(lang: lang),
          ]),
          section(id: 'apps', [
            PublishedAppsSection(lang: lang),
          ]),
          section(id: 'skills', [
            SkillsSection(lang: lang),
          ]),
          section(id: 'contributions', [
            ContributionGraphSection(lang: lang),
          ]),
          section(id: 'education', [
            EducationSection(lang: lang),
          ]),
          section(id: 'contact', [
            ContactSection(lang: lang),
          ]),
        ],
      ),
    ]);
  }
}
