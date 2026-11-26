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

    return div(classes: 'hero-wrapper section-padding container-box', [
      div(
        classes: 'hero-layout',
        [
          // Text Content (leads reading order)
          div(classes: 'hero-text-container', [
            // Eyebrow Row: Availability + Separator + Location
            div(classes: 'hero-eyebrow-row', [
              div(classes: 'hero-avail-pill', [
                span(
                  classes: 'hero-avail-dot',
                  attributes: {'aria-hidden': 'true'},
                  [],
                ),
                Component.text(content.contactAvailableLabel),
              ]),
              span(
                classes: 'hero-meta-sep',
                attributes: {'aria-hidden': 'true'},
                [Component.text('·')],
              ),
              span(classes: 'hero-location', [Component.text(kLocation)]),
            ]),

            // Name
            h1(classes: 'hero-name', [Component.text(kName)]),

            // Roles
            p(classes: 'hero-title', [Component.text(content.title)]),

            // Bio
            p(classes: 'hero-bio', [Component.text(content.bio)]),

            // Primary & Secondary CTAs + Print CV
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
              button(
                classes: 'btn-secondary print-cv-btn',
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

            // Quiet Social Links
            div(classes: 'hero-social-wrap', [
              a(
                href: kGitHub,
                target: Target.blank,
                attributes: {'rel': 'noopener noreferrer'},
                classes: 'hero-social-link',
                [Component.text('GitHub')],
              ),
              a(
                href: kLinkedIn,
                target: Target.blank,
                attributes: {'rel': 'noopener noreferrer'},
                classes: 'hero-social-link',
                [Component.text('LinkedIn')],
              ),
              a(
                href: 'mailto:$kEmail',
                classes: 'hero-social-link',
                [Component.text('Email')],
              ),
            ]),

            // Highlights Ledger
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

          // Portrait
          div(classes: 'hero-avatar-container', [
            img(
              src: kAvatarUrl,
              classes: 'hero-avatar-img',
              alt: kName,
            ),
          ]),
        ],
      ),
    ]);
  }
}
