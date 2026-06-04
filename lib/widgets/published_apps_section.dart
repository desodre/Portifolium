import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import 'section_title.dart';

class PublishedAppsSection extends StatelessComponent {
  final String lang;

  const PublishedAppsSection({super.key, required this.lang});

  @override
  Component build(BuildContext context) {
    final content = kContent[lang]!;

    return div(classes: 'section-padding container-box', [
      SectionTitle(
        title: content.sectionPublishedApps,
        subtitle: content.sectionPublishedAppsSubtitle,
      ),
      div(classes: 'apps-list-container', [
        for (var i = 0; i < content.publishedApps.length; i++)
          () {
            final app = content.publishedApps[i];
            return div(classes: 'app-row', [
              // Info Column
              div(classes: 'app-info-col', [
                h3(classes: 'app-row-title', [Component.text(app.name)]),
                p(classes: 'app-row-desc', [Component.text(app.description)]),
                
                // Tech chips
                div(classes: 'tech-chips-wrap app-tech-chips', [
                  for (final tech in app.techStack)
                    div(classes: 'tech-chip', [Component.text(tech)]),
                ]),
                
                // Action Buttons
                div(classes: 'app-actions-wrap', [
                  a(
                    href: app.storeUrl,
                    target: Target.blank,
                    classes: 'social-btn store-btn',
                    [
                      span(
                        classes: 'material-symbols-outlined icon',
                        [Component.text('open_in_new')],
                      ),
                      span([Component.text(lang == 'pt' ? 'Acessar App' : 'Open App')]),
                    ],
                  ),
                  if (app.repoUrl != null)
                    a(
                      href: app.repoUrl!,
                      target: Target.blank,
                      classes: 'social-btn repo-btn',
                      [
                        span(
                          classes: 'material-symbols-outlined icon',
                          [Component.text('code')],
                        ),
                        span([Component.text('GitHub')]),
                      ],
                    ),
                ]),
              ]),
              
              // 3D iPhone Mockup Column
              div(classes: 'app-mockup-col', [
                div(classes: 'phone-perspective', [
                  div(classes: 'phone-device', [
                    // Dynamic notch
                    div(classes: 'phone-notch', []),
                    // Side physical buttons
                    div(classes: 'phone-volume-up', []),
                    div(classes: 'phone-volume-down', []),
                    div(classes: 'phone-power-button', []),
                    // Screen containing the PNG screenshot
                    div(
                      classes: 'phone-screen',
                      styles: Styles(raw: {
                        'background-image': "url('${app.screenshotAsset}')",
                      }),
                      [],
                    ),
                  ]),
                ]),
              ]),
            ]);
          }(),
      ]),
    ]);
  }
}
