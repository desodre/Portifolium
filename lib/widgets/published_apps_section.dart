import 'dart:async';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import '../utils/web_utils.dart';
import 'section_title.dart';

class PublishedAppsSection extends StatefulComponent {
  final String lang;

  const PublishedAppsSection({super.key, required this.lang});

  @override
  State<PublishedAppsSection> createState() => _PublishedAppsSectionState();
}

class _PublishedAppsSectionState extends State<PublishedAppsSection> {
  AppCategory _activeCategory = AppCategory.mobile;
  int _activeSlideIndex = 0;
  int _activeImageIndex = 0;
  Timer? _slideshowTimer;
  bool _isHovered = false;
  bool _isFocusedWithin = false;
  bool _isPageHidden = false;
  bool _lightboxOpen = false;
  Unsubscribe? _unsubEsc;
  Unsubscribe? _unsubFocusTrap;
  Unsubscribe? _unsubVisibility;
  String? _copiedPkgName;
  Timer? _copyPkgTimer;

  bool get _shouldPause =>
      _isHovered ||
      _isFocusedWithin ||
      _lightboxOpen ||
      _isPageHidden ||
      prefersReducedMotion();

  @override
  void initState() {
    super.initState();
    _startSlideshow();
    _unsubEsc = subscribeEscapeKey(_closeLightbox);
    if (kIsWeb) {
      _unsubVisibility = subscribeVisibilityChange((isHidden) {
        if (!mounted) return;
        setState(() => _isPageHidden = isHidden);
      });
    }
  }

  Future<void> _handleCopyPackageCmd(String pkgName, String cmd) async {
    final ok = await copyToClipboard(cmd);
    if (!mounted || !ok) return;
    _copyPkgTimer?.cancel();
    setState(() => _copiedPkgName = pkgName);
    _copyPkgTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copiedPkgName = null);
    });
  }

  List<PublishedApp> _filteredApps() => kContent[component.lang]!
      .publishedApps
      .where((app) => app.category == _activeCategory)
      .toList();

  String _screenAlt(String appName, int index) => component.lang == 'pt'
      ? 'Interface de $appName — tela ${index + 1}'
      : '$appName interface — screen ${index + 1}';

  void _startSlideshow() {
    _slideshowTimer?.cancel();
    if (!kIsWeb || prefersReducedMotion()) return;
    final filteredApps = _filteredApps();
    final safeIndex = filteredApps.isEmpty
        ? 0
        : (_activeSlideIndex >= filteredApps.length ? 0 : _activeSlideIndex);
    if (filteredApps.isNotEmpty &&
        filteredApps[safeIndex].screenshotAssets.length > 1) {
      _slideshowTimer = Timer.periodic(const Duration(seconds: 3), (_) {
        if (!mounted || _shouldPause) return;
        final apps = _filteredApps();
        final idx = apps.isEmpty
            ? 0
            : (_activeSlideIndex >= apps.length ? 0 : _activeSlideIndex);
        if (apps.isNotEmpty) {
          final totalImages = apps[idx].screenshotAssets.length;
          if (totalImages > 1) {
            setState(() {
              _activeImageIndex = (_activeImageIndex + 1) % totalImages;
            });
          }
        }
      });
    }
  }

  void _selectCategory(AppCategory category) {
    if (_activeCategory != category) {
      if (_lightboxOpen) _closeLightbox();
      setState(() {
        _activeCategory = category;
        _activeSlideIndex = 0;
        _activeImageIndex = 0;
      });
      _startSlideshow();
    }
  }

  void _prevSlide(int total) {
    if (total <= 1) return;
    if (_lightboxOpen) _closeLightbox();
    setState(() {
      _activeSlideIndex = (_activeSlideIndex - 1 + total) % total;
      _activeImageIndex = 0;
    });
    _startSlideshow();
  }

  void _nextSlide(int total) {
    if (total <= 1) return;
    if (_lightboxOpen) _closeLightbox();
    setState(() {
      _activeSlideIndex = (_activeSlideIndex + 1) % total;
      _activeImageIndex = 0;
    });
    _startSlideshow();
  }

  void _goToSlide(int index) {
    if (_lightboxOpen) _closeLightbox();
    setState(() {
      _activeSlideIndex = index;
      _activeImageIndex = 0;
    });
    _startSlideshow();
  }

  void _openLightbox() {
    if (!_lightboxOpen) {
      saveActiveFocus();
      setBodyScrollLocked(true);
      _unsubFocusTrap?.call();
      _unsubFocusTrap = subscribeDialogFocusTrap('.lightbox-dialog');
      setState(() {
        _lightboxOpen = true;
      });
      focusElementBySelector('.lightbox-dialog');
    }
  }

  void _closeLightbox() {
    if (_lightboxOpen) {
      _unsubFocusTrap?.call();
      _unsubFocusTrap = null;
      setBodyScrollLocked(false);
      if (mounted) {
        setState(() {
          _lightboxOpen = false;
        });
      }
      restoreSavedFocus();
    }
  }

  @override
  void dispose() {
    _slideshowTimer?.cancel();
    _copyPkgTimer?.cancel();
    if (_lightboxOpen) {
      setBodyScrollLocked(false);
    }
    _unsubFocusTrap?.call();
    _unsubVisibility?.call();
    _unsubEsc?.call();
    super.dispose();
  }

  @override
  Component build(BuildContext context) {
    final content = kContent[component.lang]!;
    final filteredApps = _filteredApps();

    final currentIndex = filteredApps.isEmpty
        ? 0
        : (_activeSlideIndex >= filteredApps.length ? 0 : _activeSlideIndex);
    final currentApp =
        filteredApps.isNotEmpty ? filteredApps[currentIndex] : null;
    final assets = currentApp?.screenshotAssets ?? const <String>[];
    final safeImgIdx = assets.isEmpty
        ? 0
        : (_activeImageIndex >= assets.length ? 0 : _activeImageIndex);

    final categories = [
      (AppCategory.mobile, 'smartphone', content.categoryMobile),
      (AppCategory.desktop, 'laptop_mac', content.categoryDesktop),
      (AppCategory.web, 'language', content.categoryWeb),
    ];

    return div(classes: 'section-padding container-box', [
      SectionTitle(
        title: content.sectionPublishedApps,
        subtitle: content.sectionPublishedAppsSubtitle,
        indexTag: '03',
      ),

      // ── Category Selector Tabs ─────────────────────────────────────────────
      div(
        classes: 'apps-category-tabs',
        attributes: {
          'role': 'tablist',
          'aria-label': content.sectionPublishedApps,
        },
        [
          for (final (cat, iconName, label) in categories)
            () {
              final catCount = content.publishedApps
                  .where((app) => app.category == cat)
                  .length;
              return button(
                classes:
                    'category-tab${_activeCategory == cat ? ' active' : ''}',
                attributes: {
                  'type': 'button',
                  'role': 'tab',
                  'aria-selected': '${_activeCategory == cat}',
                },
                events: {'click': (e) => _selectCategory(cat)},
                [
                  span(
                    classes: 'material-symbols-outlined icon',
                    attributes: {'aria-hidden': 'true'},
                    [Component.text(iconName)],
                  ),
                  span([Component.text(label)]),
                  span(
                    classes: 'category-count',
                    [Component.text('$catCount')],
                  ),
                ],
              );
            }(),
        ],
      ),

      // ── Carousel Container ──────────────────────────────────────────────────
      if (currentApp != null)
        div(classes: 'app-stage-card', [
          div(classes: 'carousel-wrapper', [
            // Left Navigation Arrow
            if (filteredApps.length > 1)
              button(
                classes: 'carousel-nav-btn prev-btn',
                attributes: {
                  'type': 'button',
                  'aria-label': content.appPrevLabel,
                },
                events: {'click': (e) => _prevSlide(filteredApps.length)},
                [
                  span(
                    classes: 'material-symbols-outlined',
                    attributes: {'aria-hidden': 'true'},
                    [Component.text('chevron_left')],
                  ),
                ],
              ),

            // Active Slide Item
            div(classes: 'carousel-slide-content', [
              div(classes: 'app-row', [
              // Info Column
              div(classes: 'app-info-col', [
                div(classes: 'app-title-header', [
                  h3(
                      classes: 'app-row-title',
                      [Component.text(currentApp.name)]),
                  if (currentApp.badgeNote != null)
                    span(
                      classes: 'app-badge-note',
                      [Component.text(currentApp.badgeNote!)],
                    ),
                ]),
                p(
                    classes: 'app-row-desc',
                    [Component.text(currentApp.description)]),

                // Tech chips
                div(classes: 'tech-chips-wrap app-tech-chips', [
                  for (final tech in currentApp.techStack)
                    div(classes: 'tech-chip', [Component.text(tech)]),
                ]),

                // Action Buttons
                div(classes: 'app-actions-wrap', [
                  if (currentApp.storeUrl != null)
                    a(
                      href: currentApp.storeUrl!,
                      target: Target.blank,
                      classes: 'social-btn store-btn',
                      attributes: {'rel': 'noopener noreferrer'},
                      [
                        span(
                          classes: 'material-symbols-outlined icon',
                          attributes: {'aria-hidden': 'true'},
                          [Component.text('open_in_new')],
                        ),
                        span([
                          Component.text(currentApp.category == AppCategory.web
                              ? (component.lang == 'pt'
                                  ? 'Acessar site'
                                  : 'Visit website')
                              : (component.lang == 'pt'
                                  ? 'Acessar Projeto'
                                  : 'Open Project')),
                        ]),
                      ],
                    ),
                  if (currentApp.repoUrl != null)
                    a(
                      href: currentApp.repoUrl!,
                      target: Target.blank,
                      classes: 'social-btn repo-btn',
                      attributes: {'rel': 'noopener noreferrer'},
                      [
                        span(
                          classes: 'material-symbols-outlined icon',
                          attributes: {'aria-hidden': 'true'},
                          [Component.text('code')],
                        ),
                        span([Component.text('GitHub')]),
                      ],
                    ),
                ]),
              ]),

              // Device Mockup Column
              div(classes: 'app-mockup-col', [
                div(
                  classes: 'mockup-interactive-wrap',
                  events: {
                    'mouseenter': (_) {
                      if (!_isHovered) setState(() => _isHovered = true);
                    },
                    'mouseleave': (_) {
                      if (_isHovered) setState(() => _isHovered = false);
                    },
                    'focusin': (_) {
                      if (!_isFocusedWithin) {
                        setState(() => _isFocusedWithin = true);
                      }
                    },
                    'focusout': (_) {
                      if (_isFocusedWithin) {
                        setState(() => _isFocusedWithin = false);
                      }
                    },
                  },
                  [
                    button(
                      classes: 'mockup-trigger',
                      attributes: {
                        'type': 'button',
                        'aria-label':
                            '${currentApp.name} — ${content.appZoomHint}',
                      },
                      events: {'click': (_) => _openLightbox()},
                      [
                        _buildDeviceMockup(currentApp, safeImgIdx),
                        span(classes: 'mockup-zoom-badge', [
                          span(
                            classes: 'material-symbols-outlined icon',
                            attributes: {'aria-hidden': 'true'},
                            [Component.text('zoom_in')],
                          ),
                          span([Component.text(content.appZoomHint)]),
                        ]),
                      ],
                    ),
                    if (assets.length > 1)
                      div(
                        classes: 'mockup-screen-dots',
                        attributes: {
                          'role': 'group',
                          'aria-label': currentApp.name,
                        },
                        [
                          for (var i = 0; i < assets.length; i++)
                            button(
                              classes:
                                  'mockup-screen-dot${safeImgIdx == i ? ' active' : ''}',
                              attributes: {
                                'type': 'button',
                                'aria-label':
                                    '${content.appScreenshotPrefix} ${i + 1}',
                                'aria-pressed': '${safeImgIdx == i}',
                              },
                              events: {
                                'click': (_) {
                                  setState(() => _activeImageIndex = i);
                                  _startSlideshow();
                                },
                              },
                              [],
                            ),
                        ],
                      ),
                  ],
                ),
              ]),
            ]),
          ]),

          // Right Navigation Arrow
          if (filteredApps.length > 1)
            button(
              classes: 'carousel-nav-btn next-btn',
              attributes: {
                'type': 'button',
                'aria-label': content.appNextLabel,
              },
              events: {'click': (e) => _nextSlide(filteredApps.length)},
              [
                span(
                  classes: 'material-symbols-outlined',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text('chevron_right')],
                ),
              ],
            ),
          ]),
        ]),

      // ── Carousel Dots ─────────────────────────────────────────────────────
      if (filteredApps.length > 1)
        div(classes: 'carousel-dots', [
          for (var i = 0; i < filteredApps.length; i++)
            button(
              classes: 'carousel-dot${currentIndex == i ? ' active' : ''}',
              attributes: {
                'type': 'button',
                'aria-label':
                    '${content.appSlideDotPrefix} ${i + 1}: ${filteredApps[i].name}',
                'aria-current': currentIndex == i ? 'true' : 'false',
              },
              events: {'click': (e) => _goToSlide(i)},
              [],
            ),
        ]),

      // ── Lightbox Modal ────────────────────────────────────────────────────
      if (_lightboxOpen && currentApp != null && assets.isNotEmpty)
        div(
          classes: 'lightbox-backdrop',
          events: {'click': (_) => _closeLightbox()},
          [
            div(
              classes: 'lightbox-dialog',
              attributes: {
                'role': 'dialog',
                'aria-modal': 'true',
                'aria-labelledby': 'lightbox-title',
                'tabindex': '-1',
              },
              events: {'click': (e) => e.stopPropagation()},
              [
                div(classes: 'lightbox-header', [
                  div(classes: 'lightbox-title-group', [
                    h3(
                      id: 'lightbox-title',
                      classes: 'lightbox-title',
                      [Component.text(currentApp.name)],
                    ),
                    span(
                      classes: 'lightbox-counter',
                      [
                        Component.text('${safeImgIdx + 1} / ${assets.length}')
                      ],
                    ),
                  ]),
                  button(
                    classes: 'lightbox-close-btn',
                    attributes: {
                      'type': 'button',
                      'aria-label': content.appCloseLightbox,
                    },
                    events: {'click': (_) => _closeLightbox()},
                    [
                      span(
                        classes: 'material-symbols-outlined',
                        attributes: {'aria-hidden': 'true'},
                        [Component.text('close')],
                      ),
                    ],
                  ),
                ]),
                div(classes: 'lightbox-body', [
                  img(
                    src: assets[safeImgIdx],
                    classes: 'lightbox-img',
                    alt: _screenAlt(currentApp.name, safeImgIdx),
                  ),
                ]),
                if (assets.length > 1)
                  div(classes: 'lightbox-controls', [
                    button(
                      classes: 'lightbox-nav-btn',
                      attributes: {
                        'type': 'button',
                        'aria-label': content.appPrevLabel,
                      },
                      events: {
                        'click': (_) => setState(() {
                              _activeImageIndex =
                                  (safeImgIdx - 1 + assets.length) %
                                      assets.length;
                            }),
                      },
                      [
                        span(
                          classes: 'material-symbols-outlined',
                          attributes: {'aria-hidden': 'true'},
                          [Component.text('chevron_left')],
                        ),
                      ],
                    ),
                    button(
                      classes: 'lightbox-nav-btn',
                      attributes: {
                        'type': 'button',
                        'aria-label': content.appNextLabel,
                      },
                      events: {
                        'click': (_) => setState(() {
                              _activeImageIndex =
                                  (safeImgIdx + 1) % assets.length;
                            }),
                      },
                      [
                        span(
                          classes: 'material-symbols-outlined',
                          attributes: {'aria-hidden': 'true'},
                          [Component.text('chevron_right')],
                        ),
                      ],
                    ),
                  ]),
              ],
            ),
          ],
        ),

      // ───────────────────────────────────────────────────────────────────────
      // ── SUBSECTION: Devs4Devs ──────────────────────────────────────────────
      // ───────────────────────────────────────────────────────────────────────
      div(classes: 'opensource-section-block', [
        div(classes: 'section-header-block sub-header', [
          div(
            classes: 'section-eyebrow',
            attributes: {'aria-hidden': 'true'},
            [
              span(
                classes: 'section-index-tag',
                [Component.text('03.1')],
              ),
              div(classes: 'section-eyebrow-rule', []),
            ],
          ),
          div(classes: 'section-title-row', [
            h3(
                classes: 'section-title-text',
                [Component.text(content.sectionOpenSourceTitle)]),
          ]),
          p(
              classes: 'section-subtitle-text',
              [Component.text(content.sectionOpenSourceSubtitle)]),
        ]),
        div(classes: 'opensource-grid', [
          for (final lib in content.openSourceLibraries)
            div(classes: 'library-card', [
              div(classes: 'lib-card-header', [
                span(
                  classes: 'registry-badge',
                  [Component.text(lib.badgeText ?? lib.registry)],
                ),
                a(
                  href: lib.url,
                  target: Target.blank,
                  classes: 'lib-link-icon',
                  attributes: {
                    'rel': 'noopener noreferrer',
                    'aria-label': '${lib.name} (${lib.registry})',
                  },
                  [
                    span(
                      classes: 'material-symbols-outlined',
                      attributes: {'aria-hidden': 'true'},
                      [Component.text('open_in_new')],
                    ),
                  ],
                ),
              ]),
              h4(classes: 'lib-name', [Component.text(lib.name)]),
              p(classes: 'lib-desc', [Component.text(lib.description)]),
              if (lib.installCommand != null)
                () {
                  final isCopied = _copiedPkgName == lib.name;
                  return div(classes: 'lib-cmd-bar', [
                    span(
                      classes: 'lib-cmd-prompt',
                      attributes: {'aria-hidden': 'true'},
                      [Component.text(r'$')],
                    ),
                    code(
                      classes: 'lib-cmd-text',
                      [Component.text(lib.installCommand!)],
                    ),
                    button(
                      classes: 'lib-cmd-copy-btn${isCopied ? ' copied' : ''}',
                      attributes: {
                        'type': 'button',
                        'aria-label':
                            '${content.pkgCopyCommand}: ${lib.installCommand!}',
                        'title': isCopied
                            ? content.pkgCommandCopied
                            : content.pkgCopyCommand,
                      },
                      events: {
                        'click': (_) => _handleCopyPackageCmd(
                              lib.name,
                              lib.installCommand!,
                            ),
                      },
                      [
                        span(
                          classes: 'material-symbols-outlined icon',
                          attributes: {'aria-hidden': 'true'},
                          [Component.text(isCopied ? 'check' : 'content_copy')],
                        ),
                        if (isCopied)
                          span(
                            classes: 'lib-cmd-copied-text',
                            [
                              Component.text(
                                component.lang == 'pt' ? 'Copiado' : 'Copied',
                              ),
                            ],
                          ),
                      ],
                    ),
                  ]);
                }(),
              div(classes: 'tech-chips-wrap lib-techs', [
                for (final tech in lib.techStack)
                  div(classes: 'small-chip', [Component.text(tech)]),
              ]),
            ]),
        ]),
        span(
          classes: 'sr-only',
          attributes: {'aria-live': 'polite'},
          [
            Component.text(
              _copiedPkgName != null
                  ? '${_copiedPkgName!}: ${content.pkgCommandCopied}'
                  : '',
            ),
          ],
        ),
      ]),
    ]);
  }

  /// Builds a list of stacked image layers for slideshow fade effect
  List<Component> _buildScreenImages(PublishedApp app, int activeIndex) {
    final assets = app.screenshotAssets;
    return [
      for (var i = 0; i < assets.length; i++)
        img(
          src: assets[i],
          alt: _screenAlt(app.name, i),
          classes: 'screen-image${activeIndex == i ? ' active' : ''}',
        ),
    ];
  }

  Component _buildDeviceMockup(PublishedApp app, int activeImageIndex) {
    switch (app.category) {
      case AppCategory.mobile:
        return div(classes: 'phone-device', [
          div(classes: 'phone-notch', []),
          div(classes: 'phone-volume-up', []),
          div(classes: 'phone-volume-down', []),
          div(classes: 'phone-power-button', []),
          div(
            classes: 'phone-screen media-stage',
            _buildScreenImages(app, activeImageIndex),
          ),
        ]);

      case AppCategory.desktop:
        return div(classes: 'laptop-device', [
          div(classes: 'laptop-topbar', [
            div(classes: 'laptop-camera-dot', []),
          ]),
          div(
            classes: 'laptop-screen media-stage',
            _buildScreenImages(app, activeImageIndex),
          ),
        ]);

      case AppCategory.web:
        return div(classes: 'browser-device', [
          div(classes: 'browser-topbar', [
            div(classes: 'browser-traffic-lights', [
              div(classes: 'browser-dot', []),
              div(classes: 'browser-dot', []),
              div(classes: 'browser-dot', []),
            ]),
            div(classes: 'browser-addressbar', [
              span(
                classes: 'browser-url-text',
                [Component.text(app.storeUrl ?? app.repoUrl ?? '')],
              ),
            ]),
          ]),
          div(
            classes: 'browser-screen media-stage',
            _buildScreenImages(app, activeImageIndex),
          ),
        ]);
    }
  }
}
