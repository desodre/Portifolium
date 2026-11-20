import 'dart:async';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import '../utils/web_utils.dart';
import 'section_title.dart';

class ContactSection extends StatefulComponent {
  final String lang;

  const ContactSection({super.key, required this.lang});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool _emailCopied = false;
  Timer? _copiedTimer;

  @override
  void dispose() {
    _copiedTimer?.cancel();
    super.dispose();
  }

  Future<void> _handleCopyEmail() async {
    final ok = await copyToClipboard(kEmail);
    if (!mounted || !ok) return;
    _copiedTimer?.cancel();
    setState(() => _emailCopied = true);
    _copiedTimer = Timer(const Duration(milliseconds: 2500), () {
      if (mounted) setState(() => _emailCopied = false);
    });
  }

  @override
  Component build(BuildContext context) {
    final content = kContent[component.lang]!;

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
          button(
            classes:
                'contact-btn contact-btn-copy${_emailCopied ? ' copied' : ''}',
            attributes: {
              'type': 'button',
              'aria-label': '${content.contactCopyEmail}: $kEmail',
            },
            events: {'click': (_) => _handleCopyEmail()},
            [
              span(
                classes: 'material-symbols-outlined icon',
                attributes: {'aria-hidden': 'true'},
                [Component.text(_emailCopied ? 'check' : 'content_copy')],
              ),
              span(
                classes: 'contact-label',
                [
                  Component.text(
                    _emailCopied
                        ? content.contactCopied
                        : content.contactCopyEmail,
                  ),
                ],
              ),
              span(classes: 'contact-sublabel', [Component.text(kEmail)]),
            ],
          ),
          a(
            href: 'mailto:$kEmail',
            classes: 'contact-btn',
            [
              span(
                classes: 'material-symbols-outlined icon',
                attributes: {'aria-hidden': 'true'},
                [Component.text('mail')],
              ),
              span(
                classes: 'contact-label',
                [Component.text(content.contactSendEmail)],
              ),
              span(classes: 'contact-sublabel', [Component.text(kEmail)]),
            ],
          ),
          a(
            href: kGitHub,
            target: Target.blank,
            attributes: {'rel': 'noopener noreferrer'},
            classes: 'contact-btn',
            [
              span(
                classes: 'material-symbols-outlined icon',
                attributes: {'aria-hidden': 'true'},
                [Component.text('code')],
              ),
              span(classes: 'contact-label', [Component.text('GitHub')]),
              span(
                classes: 'contact-sublabel',
                [Component.text('github.com/desodre')],
              ),
            ],
          ),
          a(
            href: kLinkedIn,
            target: Target.blank,
            attributes: {'rel': 'noopener noreferrer'},
            classes: 'contact-btn',
            [
              span(
                classes: 'material-symbols-outlined icon',
                attributes: {'aria-hidden': 'true'},
                [Component.text('work')],
              ),
              span(classes: 'contact-label', [Component.text('LinkedIn')]),
              span(
                classes: 'contact-sublabel',
                [Component.text('in/jhonsodre')],
              ),
            ],
          ),
          a(
            href: 'tel:${kPhone.replaceAll(RegExp(r"[^\d+]"), "")}',
            classes: 'contact-btn',
            [
              span(
                classes: 'material-symbols-outlined icon',
                attributes: {'aria-hidden': 'true'},
                [Component.text('phone')],
              ),
              span(
                classes: 'contact-label',
                [
                  Component.text(
                    component.lang == 'pt' ? 'Telefone' : 'Phone',
                  ),
                ],
              ),
              span(classes: 'contact-sublabel', [Component.text(kPhone)]),
            ],
          ),
        ]),

        span(
          classes: 'sr-only',
          attributes: {'aria-live': 'polite'},
          [Component.text(_emailCopied ? content.contactCopied : '')],
        ),

        // Footer
        footer(classes: 'site-footer', [
          div(classes: 'footer-line', []),
          div(classes: 'footer-text-row', [
            Component.text('© 2026 Jhonatha Sodre · '),
            span(
              classes: 'material-symbols-outlined icon',
              attributes: {'aria-hidden': 'true'},
              [Component.text('favorite')],
            ),
            a(
              classes: 'footer-link',
              href: 'https://docs.jaspr.site/',
              target: Target.blank,
              attributes: {'rel': 'noopener noreferrer'},
              [Component.text(' ${content.contactBuiltWith}')],
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
