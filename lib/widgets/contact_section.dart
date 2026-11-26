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
        indexTag: '07',
      ),
      div(classes: 'contact-center-wrap', [
        // Availability Label with flat 7px dot
        div(classes: 'contact-availability', [
          span(
            classes: 'contact-avail-dot',
            attributes: {'aria-hidden': 'true'},
            [],
          ),
          span([Component.text(content.contactAvailableLabel)]),
        ]),

        // Contact Ledger
        div(classes: 'contact-ledger', [
          button(
            classes:
                'contact-row contact-row-copy${_emailCopied ? ' copied' : ''}',
            attributes: {
              'type': 'button',
              'aria-label': '${content.contactCopyEmail}: $kEmail',
            },
            events: {'click': (_) => _handleCopyEmail()},
            [
              span(
                classes: 'contact-row-label',
                [Component.text(content.contactCopyEmail)],
              ),
              span(classes: 'contact-row-value', [Component.text(kEmail)]),
              span(classes: 'contact-row-action', [
                if (_emailCopied)
                  span(
                    classes: 'contact-copied-text',
                    [
                      Component.text(
                        component.lang == 'pt' ? 'Copiado' : 'Copied',
                      ),
                    ],
                  ),
                span(
                  classes: 'material-symbols-outlined icon',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text(_emailCopied ? 'check' : 'content_copy')],
                ),
              ]),
            ],
          ),
          a(
            href: 'mailto:$kEmail',
            classes: 'contact-row',
            [
              span(
                classes: 'contact-row-label',
                [Component.text(content.contactSendEmail)],
              ),
              span(classes: 'contact-row-value', [Component.text(kEmail)]),
              span(classes: 'contact-row-action', [
                span(
                  classes: 'material-symbols-outlined icon',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text('mail')],
                ),
              ]),
            ],
          ),
          a(
            href: kGitHub,
            target: Target.blank,
            attributes: {'rel': 'noopener noreferrer'},
            classes: 'contact-row',
            [
              span(
                classes: 'contact-row-label',
                [Component.text('GitHub')],
              ),
              span(
                classes: 'contact-row-value',
                [Component.text('github.com/desodre')],
              ),
              span(classes: 'contact-row-action', [
                span(
                  classes: 'material-symbols-outlined icon',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text('open_in_new')],
                ),
              ]),
            ],
          ),
          a(
            href: kLinkedIn,
            target: Target.blank,
            attributes: {'rel': 'noopener noreferrer'},
            classes: 'contact-row',
            [
              span(
                classes: 'contact-row-label',
                [Component.text('LinkedIn')],
              ),
              span(
                classes: 'contact-row-value',
                [Component.text('linkedin.com/in/jhonsodre')],
              ),
              span(classes: 'contact-row-action', [
                span(
                  classes: 'material-symbols-outlined icon',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text('open_in_new')],
                ),
              ]),
            ],
          ),
          a(
            href: 'tel:${kPhone.replaceAll(RegExp(r"[^\d+]"), "")}',
            classes: 'contact-row',
            [
              span(
                classes: 'contact-row-label',
                [
                  Component.text(
                    component.lang == 'pt' ? 'Telefone' : 'Phone',
                  ),
                ],
              ),
              span(classes: 'contact-row-value', [Component.text(kPhone)]),
              span(classes: 'contact-row-action', [
                span(
                  classes: 'material-symbols-outlined icon',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text('phone')],
                ),
              ]),
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
          div(classes: 'footer-bottom-row', [
            div(classes: 'footer-text-row', [
              Component.text('© ${DateTime.now().year} Jhonatha Sodre · '),
              a(
                classes: 'footer-link',
                href: 'https://docs.jaspr.site/',
                target: Target.blank,
                attributes: {'rel': 'noopener noreferrer'},
                [Component.text(content.contactBuiltWith)],
              ),
            ]),
            button(
              classes: 'back-to-top-btn',
              attributes: {
                'type': 'button',
                'aria-label': content.backToTopLabel,
              },
              events: {'click': (_) => scrollToSection('home')},
              [
                span([Component.text(content.backToTopLabel)]),
                span(
                  classes: 'material-symbols-outlined icon',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text('arrow_upward')],
                ),
              ],
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
