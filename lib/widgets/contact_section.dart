import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import 'section_title.dart';

class ContactSection extends StatelessComponent {
  final String lang;

  const ContactSection({super.key, required this.lang});

  @override
  Component build(BuildContext context) {
    final content = kContent[lang]!;

    return div(classes: 'section-padding container-box', [
      SectionTitle(
        title: content.sectionContact,
        subtitle: content.sectionContactSubtitle,
      ),
      div(classes: 'contact-center-wrap', [
        // Availability Badge
        div(classes: 'availability-badge', [
          div(classes: 'avail-dot', []),
          Component.text(content.contactAvailableLabel),
        ]),

        // Contact Buttons
        div(classes: 'contact-buttons-wrap', [
          a(
            href: 'mailto:$kEmail',
            classes: 'contact-btn',
            [
              span(
                  classes: 'material-symbols-outlined icon',
                  [Component.text('mail')]),
              span(classes: 'contact-label', [Component.text('Email')]),
              span(classes: 'contact-sublabel', [Component.text(kEmail)]),
            ],
          ),
          a(
            href: kGitHub,
            target: Target.blank,
            classes: 'contact-btn',
            [
              span(
                  classes: 'material-symbols-outlined icon',
                  [Component.text('code')]),
              span(classes: 'contact-label', [Component.text('GitHub')]),
              span(
                  classes: 'contact-sublabel',
                  [Component.text('github.com/desodre')]),
            ],
          ),
          a(
            href: kLinkedIn,
            target: Target.blank,
            classes: 'contact-btn',
            [
              span(
                  classes: 'material-symbols-outlined icon',
                  [Component.text('work')]),
              span(classes: 'contact-label', [Component.text('LinkedIn')]),
              span(
                  classes: 'contact-sublabel',
                  [Component.text('in/jhonsodre')]),
            ],
          ),
          a(
            href: 'tel:${kPhone.replaceAll(RegExp(r"[^\d+]"), "")}',
            classes: 'contact-btn',
            [
              span(
                  classes: 'material-symbols-outlined icon',
                  [Component.text('phone')]),
              span(
                  classes: 'contact-label',
                  [Component.text(lang == 'pt' ? 'Telefone' : 'Phone')]),
              span(classes: 'contact-sublabel', [Component.text(kPhone)]),
            ],
          ),
        ]),

        // Footer Line
        div(classes: 'footer-line', []),

        // Footer Text
        div(classes: 'footer-text-row', [
          Component.text('© 2026 Jhonatha Sodre · '),
          span(
              classes: 'material-symbols-outlined icon',
              [Component.text('favorite')]),
          a(
            classes: 'footer-link',
            href: 'https://docs.jaspr.site/',
            target: Target.blank,
            [Component.text(' ${content.contactBuiltWith}')],
          ),
        ]),
      ]),
    ]);
  }
}
