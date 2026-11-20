import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import '../utils/web_utils.dart';

class HeroSection extends StatelessComponent {
  final String lang;

  const HeroSection({super.key, required this.lang});

  @override
  Component build(BuildContext context) {
    final content = kContent[lang]!;

    return div(classes: 'hero-section-bg', [
      div(classes: 'hero-wrapper section-padding container-box', [
        div(
          classes: 'hero-layout',
          [
            // Avatar Image (rendered first, will show on top on mobile, on the right on desktop)
            div(classes: 'hero-avatar-container', [
              img(
                src: kAvatarUrl,
                classes: 'hero-avatar-img',
                alt: kName,
              ),
            ]),

            // Text Content
            div(classes: 'hero-text-container', [
              // Greeting Badge
              div(
                classes: 'hero-badge',
                [Component.text(content.heroGreeting)],
              ),

              // Name
              h1(classes: 'hero-name', [Component.text(kName)]),

              // Title
              p(classes: 'hero-title', [Component.text(content.title)]),

              // Location
              div(classes: 'hero-location', [
                span(
                  classes: 'material-symbols-outlined icon',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text('location_on')],
                ),
                Component.text(kLocation),
              ]),

              // Bio
              p(classes: 'hero-bio', [Component.text(content.bio)]),

              // Primary & Secondary CTAs
              div(classes: 'hero-actions-primary', [
                a(
                  href: '#projects',
                  classes: 'btn-primary',
                  events: {
                    'click': (e) {
                      e.preventDefault();
                      scrollToSection('projects');
                    }
                  },
                  [
                    Component.text(content.heroPrimaryCta),
                    span(
                      classes: 'material-symbols-outlined icon',
                      attributes: {'aria-hidden': 'true'},
                      [Component.text('arrow_forward')],
                    ),
                  ],
                ),
                a(
                  href: '#experience',
                  classes: 'btn-secondary',
                  events: {
                    'click': (e) {
                      e.preventDefault();
                      scrollToSection('experience');
                    }
                  },
                  [
                    Component.text(content.heroViewWork),
                    span(
                      classes: 'material-symbols-outlined icon',
                      attributes: {'aria-hidden': 'true'},
                      [Component.text('arrow_downward')],
                    ),
                  ],
                ),
              ]),

              // Social Links
              div(classes: 'hero-social-wrap', [
                a(
                  href: kGitHub,
                  target: Target.blank,
                  attributes: {'rel': 'noopener noreferrer'},
                  classes: 'social-btn',
                  [
                    span(
                      classes: 'material-symbols-outlined icon',
                      attributes: {'aria-hidden': 'true'},
                      [Component.text('code')],
                    ),
                    Component.text('GitHub'),
                  ],
                ),
                a(
                  href: kLinkedIn,
                  target: Target.blank,
                  attributes: {'rel': 'noopener noreferrer'},
                  classes: 'social-btn',
                  [
                    span(
                      classes: 'material-symbols-outlined icon',
                      attributes: {'aria-hidden': 'true'},
                      [Component.text('work')],
                    ),
                    Component.text('LinkedIn'),
                  ],
                ),
                a(
                  href: 'mailto:$kEmail',
                  classes: 'social-btn',
                  [
                    span(
                      classes: 'material-symbols-outlined icon',
                      attributes: {'aria-hidden': 'true'},
                      [Component.text('mail')],
                    ),
                    Component.text('Email'),
                  ],
                ),
                button(
                  classes: 'social-btn print-cv-btn',
                  attributes: {
                    'type': 'button',
                    'aria-label': content.heroPrintCv,
                  },
                  events: {'click': (_) => triggerPrint()},
                  [
                    span(
                      classes: 'material-symbols-outlined icon',
                      attributes: {'aria-hidden': 'true'},
                      [Component.text('description')],
                    ),
                    Component.text(content.heroPrintCv),
                  ],
                ),
              ]),

              // Highlights Metric Strip
              div(classes: 'hero-highlights', [
                for (final item in content.heroHighlights)
                  div(classes: 'hero-highlight-item', [
                    span(
                      classes: 'hero-highlight-value',
                      [Component.text(item.value)],
                    ),
                    span(
                      classes: 'hero-highlight-label',
                      [Component.text(item.label)],
                    ),
                  ]),
              ]),
            ]),
          ],
        ),
      ]),
    ]);
  }
}
