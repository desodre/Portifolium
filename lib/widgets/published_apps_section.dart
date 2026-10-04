import 'dart:async';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
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

  @override
  void initState() {
    super.initState();
    _startSlideshow();
  }

  void _startSlideshow() {
    _slideshowTimer?.cancel();
    final content = kContent[component.lang]!;
    final filteredApps = content.publishedApps
        .where((app) => app.category == _activeCategory)
        .toList();
    final safeIndex = filteredApps.isEmpty
        ? 0
        : (_activeSlideIndex >= filteredApps.length ? 0 : _activeSlideIndex);
    if (filteredApps.isNotEmpty && filteredApps[safeIndex].screenshotAssets.length > 1) {
      _slideshowTimer = Timer.periodic(const Duration(seconds: 2), (_) {
        final apps = kContent[component.lang]!.publishedApps
            .where((app) => app.category == _activeCategory)
            .toList();
        final idx = apps.isEmpty ? 0 : (_activeSlideIndex >= apps.length ? 0 : _activeSlideIndex);
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
    setState(() {
      _activeSlideIndex = (_activeSlideIndex - 1 + total) % total;
      _activeImageIndex = 0;
    });
    _startSlideshow();
  }

  void _nextSlide(int total) {
    if (total <= 1) return;
    setState(() {
      _activeSlideIndex = (_activeSlideIndex + 1) % total;
      _activeImageIndex = 0;
    });
    _startSlideshow();
  }

  void _goToSlide(int index) {
    setState(() {
      _activeSlideIndex = index;
      _activeImageIndex = 0;
    });
    _startSlideshow();
  }

  @override
  void dispose() {
    _slideshowTimer?.cancel();
    super.dispose();
  }

  @override
  Component build(BuildContext context) {
    final content = kContent[component.lang]!;
    final filteredApps = content.publishedApps
        .where((app) => app.category == _activeCategory)
        .toList();

    final currentIndex = filteredApps.isEmpty
        ? 0
        : (_activeSlideIndex >= filteredApps.length ? 0 : _activeSlideIndex);
    final currentApp = filteredApps.isNotEmpty ? filteredApps[currentIndex] : null;

    return div(classes: 'section-padding container-box', [
      SectionTitle(
        title: content.sectionPublishedApps,
        subtitle: content.sectionPublishedAppsSubtitle,
      ),

      // ── Category Selector Tabs ─────────────────────────────────────────────
      div(classes: 'apps-category-tabs', [
        button(
          classes:
              'category-tab${_activeCategory == AppCategory.mobile ? ' active' : ''}',
          events: {'click': (e) => _selectCategory(AppCategory.mobile)},
          [
            span(
                classes: 'material-symbols-outlined icon',
                [Component.text('smartphone')]),
            span([Component.text(content.categoryMobile)]),
          ],
        ),
        button(
          classes:
              'category-tab${_activeCategory == AppCategory.desktop ? ' active' : ''}',
          events: {'click': (e) => _selectCategory(AppCategory.desktop)},
          [
            span(
                classes: 'material-symbols-outlined icon',
                [Component.text('laptop_mac')]),
            span([Component.text(content.categoryDesktop)]),
          ],
        ),
        // Web tab removed — kept in data model for future use
      ]),

      // ── Carousel Container ──────────────────────────────────────────────────
      if (currentApp != null)
        div(classes: 'carousel-wrapper', [
          // Left Navigation Arrow
          button(
            classes: 'carousel-nav-btn prev-btn',
            events: {'click': (e) => _prevSlide(filteredApps.length)},
            [
              span(
                  classes: 'material-symbols-outlined',
                  [Component.text('chevron_left')]),
            ],
          ),

          // Active Slide Item
          div(classes: 'carousel-slide-content', [
            div(classes: 'app-row', [
              // Info Column
              div(classes: 'app-info-col', [
                div(classes: 'app-title-header', [
                  h3(classes: 'app-row-title', [Component.text(currentApp.name)]),
                  if (currentApp.badgeNote != null)
                    span(
                      classes: 'app-badge-note',
                      [Component.text(currentApp.badgeNote!)],
                    ),
                ]),
                p(classes: 'app-row-desc', [Component.text(currentApp.description)]),

                // Tech chips
                div(classes: 'tech-chips-wrap app-tech-chips', [
                  for (final tech in currentApp.techStack)
                    div(classes: 'tech-chip', [Component.text(tech)]),
                ]),

                // Action Buttons
                div(classes: 'app-actions-wrap', [
                  a(
                    href: currentApp.storeUrl,
                    target: Target.blank,
                    classes: 'social-btn store-btn',
                    [
                      span(
                        classes: 'material-symbols-outlined icon',
                        [Component.text('open_in_new')],
                      ),
                      span([
                        Component.text(component.lang == 'pt'
                            ? 'Acessar Projeto'
                            : 'Open Project')
                      ]),
                    ],
                  ),
                  if (currentApp.repoUrl != null)
                    a(
                      href: currentApp.repoUrl!,
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

              // Dynamic 3D Device Mockup Column
              div(classes: 'app-mockup-col', [
                _buildDeviceMockup(currentApp),
              ]),
            ]),
          ]),

          // Right Navigation Arrow
          button(
            classes: 'carousel-nav-btn next-btn',
            events: {'click': (e) => _nextSlide(filteredApps.length)},
            [
              span(
                  classes: 'material-symbols-outlined',
                  [Component.text('chevron_right')]),
            ],
          ),
        ]),

      // ── Carousel Dots ─────────────────────────────────────────────────────
      if (filteredApps.length > 1)
        div(classes: 'carousel-dots', [
          for (var i = 0; i < filteredApps.length; i++)
            button(
              classes: 'carousel-dot${currentIndex == i ? ' active' : ''}',
              events: {'click': (e) => _goToSlide(i)},
              [],
            ),
        ]),

      // ───────────────────────────────────────────────────────────────────────
      // ── SUBSECTION: Devs4Devs ──────────────────────────────────────────────
      // ───────────────────────────────────────────────────────────────────────
      div(classes: 'opensource-section-block', [
        div(classes: 'section-header-block sub-header', [
          div(classes: 'section-title-row', [
            div(classes: 'section-title-bar', []),
            h3(classes: 'section-title-text', [
              Component.text(content.sectionOpenSourceTitle)
            ]),
          ]),
          p(classes: 'section-subtitle-text', [
            Component.text(content.sectionOpenSourceSubtitle)
          ]),
        ]),

        div(classes: 'opensource-grid', [
          for (final lib in content.openSourceLibraries)
            div(classes: 'library-card', [
              div(classes: 'lib-card-header', [
                span(
                  classes: 'registry-badge ${lib.registry.toLowerCase().replaceAll('.', '').replaceAll(' ', '')}',
                  [Component.text(lib.badgeText ?? lib.registry)],
                ),
                a(
                  href: lib.url,
                  target: Target.blank,
                  classes: 'lib-link-icon',
                  [
                    span(
                      classes: 'material-symbols-outlined',
                      [Component.text('open_in_new')],
                    ),
                  ],
                ),
              ]),
              h4(classes: 'lib-name', [Component.text(lib.name)]),
              p(classes: 'lib-desc', [Component.text(lib.description)]),
              div(classes: 'tech-chips-wrap lib-techs', [
                for (final tech in lib.techStack)
                  div(classes: 'small-chip', [Component.text(tech)]),
              ]),
            ]),
        ]),
      ]),
    ]);
  }

  /// Builds a list of stacked image layers for slideshow fade effect
  List<Component> _buildScreenImages(List<String> assets) {
    return [
      for (var i = 0; i < assets.length; i++)
        img(
          src: assets[i],
          classes: 'screen-image${_activeImageIndex == i ? ' active' : ''}',
        ),
    ];
  }

  Component _buildDeviceMockup(PublishedApp app) {
    switch (app.category) {
      case AppCategory.mobile:
        return div(classes: 'phone-perspective', [
          div(classes: 'phone-device', [
            div(classes: 'phone-notch', []),
            div(classes: 'phone-volume-up', []),
            div(classes: 'phone-volume-down', []),
            div(classes: 'phone-power-button', []),
            div(
              classes: 'phone-screen',
              _buildScreenImages(app.screenshotAssets),
            ),
          ]),
        ]);

      case AppCategory.desktop:
        return div(classes: 'laptop-perspective', [
          div(classes: 'laptop-device', [
            div(classes: 'laptop-topbar', [
              div(classes: 'laptop-camera-dot', []),
            ]),
            div(
              classes: 'laptop-screen',
              _buildScreenImages(app.screenshotAssets),
            ),
            div(classes: 'laptop-keyboard-base', [
              div(classes: 'laptop-notch-indent', []),
            ]),
          ]),
        ]);

      case AppCategory.web:
        return div(classes: 'browser-perspective', [
          div(classes: 'browser-device', [
            div(classes: 'browser-topbar', [
              div(classes: 'browser-traffic-lights', [
                div(classes: 'browser-dot red', []),
                div(classes: 'browser-dot yellow', []),
                div(classes: 'browser-dot green', []),
              ]),
              div(classes: 'browser-addressbar', [
                span(classes: 'browser-url-text', [
                  Component.text(
                      'https://${app.name.toLowerCase().replaceAll(' ', '')}.dev')
                ]),
              ]),
            ]),
            div(
              classes: 'browser-screen',
              _buildScreenImages(app.screenshotAssets),
            ),
          ]),
        ]);
    }
  }
}
