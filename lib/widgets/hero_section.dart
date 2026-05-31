import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';

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
            div(classes: 'hero-badge', [Component.text(content.heroGreeting)]),
            
            // Name
            h1(classes: 'hero-name', [Component.text(kName)]),
            
            // Title
            p(classes: 'hero-title', [Component.text(content.title)]),
            
            // Location
            div(classes: 'hero-location', [
              span(classes: 'material-symbols-outlined icon', [Component.text('location_on')]),
              Component.text(kLocation),
            ]),
            
            // Bio
            p(classes: 'hero-bio', [Component.text(content.bio)]),
            
            // Social Links
            div(classes: 'hero-social-wrap', [
              a(
                href: kGitHub,
                target: Target.blank,
                classes: 'social-btn',
                [
                  span(classes: 'material-symbols-outlined icon', [Component.text('code')]),
                  Component.text('GitHub'),
                ],
              ),
              a(
                href: kLinkedIn,
                target: Target.blank,
                classes: 'social-btn',
                [
                  span(classes: 'material-symbols-outlined icon', [Component.text('work')]),
                  Component.text('LinkedIn'),
                ],
              ),
              a(
                href: 'mailto:$kEmail',
                classes: 'social-btn',
                [
                  span(classes: 'material-symbols-outlined icon', [Component.text('mail')]),
                  Component.text('Email'),
                ],
              ),
            ]),
            
            // View My Work CTA
            a(href: '#experience', classes: 'hero-cta-row', [
              Component.text(content.heroViewWork),
              span(classes: 'material-symbols-outlined', [Component.text('arrow_downward')]),
            ]),
          ]),
        ],
      ),
    ]);
  }
}
