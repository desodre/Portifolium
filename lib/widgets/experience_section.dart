import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import '../data/portfolio_data.dart';
import 'section_title.dart';

class ExperienceSection extends StatefulComponent {
  final String lang;

  const ExperienceSection({super.key, required this.lang});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  static const int _kCollapsedBullets = 4;
  static const int _kCollapsedTechs = 8;

  final Set<int> _expandedIndices = {};

  void _toggleExpanded(int index) {
    setState(() {
      if (_expandedIndices.contains(index)) {
        _expandedIndices.remove(index);
      } else {
        _expandedIndices.add(index);
      }
    });
  }

  @override
  Component build(BuildContext context) {
    final content = kContent[component.lang]!;
    final experiences = content.experiences;

    return div(classes: 'section-padding container-box', [
      SectionTitle(
        title: content.sectionExperience,
        subtitle: content.sectionExperienceSubtitle,
      ),
      div(classes: 'timeline-container', [
        for (var i = 0; i < experiences.length; i++)
          _buildTimelineItem(
            content: content,
            entry: experiences[i],
            index: i,
            isLast: i == experiences.length - 1,
          ),
      ]),
    ]);
  }

  Component _buildTimelineItem({
    required PortfolioContent content,
    required ExperienceEntry entry,
    required int index,
    required bool isLast,
  }) {
    final hasHiddenBullets = entry.bullets.length > _kCollapsedBullets;
    final hasHiddenTechs = entry.techs.length > _kCollapsedTechs;
    final isExpandable = hasHiddenBullets || hasHiddenTechs;
    final isExpanded = _expandedIndices.contains(index);
    final hideCollapsed = isExpandable && !isExpanded;
    final hiddenBulletCount = entry.bullets.length - _kCollapsedBullets;
    final hiddenTechCount = entry.techs.length - _kCollapsedTechs;

    return div(classes: 'timeline-item', [
      // Marker Column (Dot and vertical connecting line)
      div(classes: 'timeline-marker', [
        div(classes: 'timeline-dot${entry.isCurrent ? ' current' : ''}', []),
        if (!isLast) div(classes: 'timeline-line', []),
      ]),
      // Content Card Column
      div(classes: 'timeline-content', [
        div(classes: 'experience-card', [
          // Header (Role + Optional Current Badge)
          div(classes: 'exp-header-wrap', [
            h3(classes: 'exp-role', [Component.text(entry.role)]),
            if (entry.isCurrent)
              span(
                classes: 'exp-badge',
                [
                  Component.text(
                    component.lang == 'pt' ? 'Atual' : 'Current',
                  ),
                ],
              ),
          ]),
          // Company & Period
          div(classes: 'exp-meta-row', [
            span(classes: 'exp-company', [Component.text(entry.company)]),
            Component.text(' · '),
            span(classes: 'exp-period', [Component.text(entry.period)]),
          ]),
          // Bullet points
          ul(classes: 'exp-bullet-list', [
            for (var idx = 0; idx < entry.bullets.length; idx++)
              li(
                classes:
                    'exp-bullet-item${hideCollapsed && idx >= _kCollapsedBullets ? ' exp-collapsed-hidden' : ''}',
                [
                  div(classes: 'exp-bullet-dot', []),
                  span([Component.text(entry.bullets[idx])]),
                ],
              ),
          ]),
          // Tech chips
          div(classes: 'tech-chips-wrap', [
            for (var idx = 0; idx < entry.techs.length; idx++)
              div(
                classes:
                    'tech-chip${hideCollapsed && idx >= _kCollapsedTechs ? ' exp-collapsed-hidden' : ''}',
                [Component.text(entry.techs[idx])],
              ),
            if (!isExpanded && hasHiddenTechs)
              div(
                classes: 'tech-chip tech-chip-more',
                [Component.text('+$hiddenTechCount')],
              ),
          ]),
          // Expand / Collapse toggle
          if (isExpandable)
            button(
              classes: 'exp-toggle-btn',
              attributes: {
                'type': 'button',
                'aria-expanded': '$isExpanded',
              },
              events: {'click': (e) => _toggleExpanded(index)},
              [
                span([
                  Component.text(
                    isExpanded
                        ? content.expShowLess
                        : (hasHiddenBullets
                            ? '${content.expShowMore} (+$hiddenBulletCount)'
                            : '${content.expShowMore} (+$hiddenTechCount)'),
                  ),
                ]),
                span(
                  classes: 'material-symbols-outlined icon',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text(isExpanded ? 'expand_less' : 'expand_more')],
                ),
              ],
            ),
        ]),
      ]),
    ]);
  }
}
