import 'dart:convert';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:http/http.dart' as http;
import '../data/portfolio_data.dart';
import 'section_title.dart';

class ContributionGraphSection extends StatefulComponent {
  final String lang;

  const ContributionGraphSection({super.key, required this.lang});

  @override
  State<ContributionGraphSection> createState() =>
      _ContributionGraphSectionState();
}

class _ContributionGraphSectionState extends State<ContributionGraphSection> {
  AllContributions? _data;
  bool _loading = true;
  String? _error;
  String? _inspectedText;

  @override
  void initState() {
    super.initState();
    // Only fetch contribution data on the client browser
    if (kIsWeb) {
      _fetchContributions();
    }
  }

  @override
  void didUpdateComponent(covariant ContributionGraphSection oldComponent) {
    super.didUpdateComponent(oldComponent);
    if (oldComponent.lang != component.lang) {
      _inspectedText = null;
    }
  }

  void _retryFetch() {
    setState(() {
      _loading = true;
      _error = null;
    });
    _fetchContributions();
  }

  Future<void> _fetchContributions() async {
    try {
      final uri = Uri.parse('$apiBaseContributions?y=last');
      final response = await http.get(uri);
      if (!mounted) return;
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        setState(() {
          _data = AllContributions.fromJson(json);
          _error = null;
          _loading = false;
        });
      } else {
        setState(() {
          _error = 'HTTP ${response.statusCode}';
          _loading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  void _setInspected(String summary) {
    if (_inspectedText == summary) return;
    setState(() => _inspectedText = summary);
  }

  void _clearInspected() {
    if (_inspectedText == null) return;
    setState(() => _inspectedText = null);
  }

  DateTime _getStartSunday(DateTime today) {
    var start = today.subtract(const Duration(days: 52 * 7));
    final daysBack = start.weekday % 7;
    return start.subtract(Duration(days: daysBack));
  }

  List<List<Map<String, dynamic>>> _buildWeeks(
    DateTime startSunday,
    DateTime today,
    Map<String, Contribution> map,
  ) {
    final weeks = <List<Map<String, dynamic>>>[];
    var weekStart = startSunday;

    while (!weekStart.isAfter(today)) {
      final week = <Map<String, dynamic>>[];
      for (var d = 0; d < 7; d++) {
        final day = weekStart.add(Duration(days: d));
        if (day.isAfter(today)) break;
        final key =
            '${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';
        final c = map[key];
        week.add({
          'date': day,
          'level': c?.level ?? 0,
          'count': c?.count ?? 0,
        });
      }
      weeks.add(week);
      weekStart = weekStart.add(const Duration(days: 7));
    }
    return weeks;
  }

  String _monthAbbr(int month, PortfolioContent content) =>
      content.contribMonthAbbrs[month - 1];

  String _formatDate(DateTime d, PortfolioContent content) {
    final month = _monthAbbr(d.month, content);
    return component.lang == 'pt'
        ? '${d.day} $month ${d.year}'
        : '$month ${d.day}, ${d.year}';
  }

  String _formatDaySummary(int count, DateTime date, PortfolioContent content) {
    final formattedDate = _formatDate(date, content);
    if (count == 0) {
      return '${content.contribNoneOn} $formattedDate';
    }
    if (count == 1) {
      return '1 ${content.contribSingleOn} $formattedDate';
    }
    return '$count ${content.contribPluralOn} $formattedDate';
  }

  String _legendLevelLabel(int level) {
    final isPt = component.lang == 'pt';
    return switch (level) {
      0 => isPt
          ? 'Nível 0: nenhuma contribuição'
          : 'Level 0: no contributions',
      1 => isPt ? 'Nível 1: poucas contribuições' : 'Level 1: low activity',
      2 => isPt
          ? 'Nível 2: contribuições moderadas'
          : 'Level 2: moderate activity',
      3 => isPt ? 'Nível 3: muitas contribuições' : 'Level 3: high activity',
      _ => isPt
          ? 'Nível 4: atividade máxima'
          : 'Level 4: highest activity',
    };
  }

  @override
  Component build(BuildContext context) {
    final content = kContent[component.lang]!;
    final loadingLabel = component.lang == 'pt'
        ? 'Carregando contribuições do GitHub...'
        : 'Loading GitHub contributions...';

    return div(classes: 'section-padding container-box', [
      SectionTitle(
        title: content.sectionContributions,
        subtitle: content.sectionContributionsSubtitle,
        indexTag: '05',
      ),
      div(classes: 'graph-card', [
        if (_loading)
          div(
            classes: 'graph-loading',
            attributes: {
              'role': 'status',
              'aria-live': 'polite',
              'aria-busy': 'true',
              'aria-label': loadingLabel,
            },
            [
              p(classes: 'graph-loading-label', [Component.text(loadingLabel)]),
              div(
                classes: 'graph-placeholder-grid',
                attributes: {'aria-hidden': 'true'},
                [
                  for (var col = 0; col < 26; col++)
                    div(classes: 'graph-placeholder-col', [
                      for (var row = 0; row < 7; row++)
                        div(classes: 'graph-placeholder-cell', []),
                    ]),
                ],
              ),
            ],
          )
        else if (_error != null)
          div(classes: 'graph-error-box', [
            p(classes: 'graph-error-text', [
              Component.text(component.lang == 'pt'
                  ? 'Não foi possível carregar as contribuições: $_error'
                  : 'Could not load contributions: $_error'),
            ]),
            button(
              classes: 'graph-retry-btn',
              attributes: {'type': 'button'},
              events: {'click': (_) => _retryFetch()},
              [
                span(
                  classes: 'material-symbols-outlined icon',
                  attributes: {'aria-hidden': 'true'},
                  [Component.text('refresh')],
                ),
                Component.text(content.contribRetryLabel),
              ],
            ),
          ])
        else
          div([
            ..._buildGraphContent(content),
          ]),
      ]),
    ]);
  }

  List<Component> _buildGraphContent(PortfolioContent content) {
    final data = _data!;
    final totalCount = data.total['lastYear'] ?? 0;

    final contributionMap = <String, Contribution>{};
    for (final c in data.contributions) {
      contributionMap[c.date] = c;
    }

    final today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    final startDate = _getStartSunday(today);
    final weeks = _buildWeeks(startDate, today, contributionMap);

    return [
      div(classes: 'graph-header-row', [
        div(classes: 'graph-title', [
          Component.text('$totalCount ${content.contributionsInLastYear}'),
        ]),
        a(
          href: kGitHub,
          target: Target.blank,
          classes: 'graph-profile-pill',
          attributes: {'rel': 'noopener noreferrer'},
          [
            span(
              classes: 'material-symbols-outlined icon',
              attributes: {'aria-hidden': 'true'},
              [Component.text('code')],
            ),
            Component.text('@desodre'),
          ],
        ),
      ]),

      div(classes: 'graph-scroll-container', [
        div(classes: 'contrib-grid-wrapper', [
          // Days column labels
          div(classes: 'contrib-days-labels', [
            div(classes: 'contrib-day-label', [Component.text('')]),
            div(
              classes: 'contrib-day-label',
              [Component.text(content.contribDayLabels[0])],
            ),
            div(classes: 'contrib-day-label', [Component.text('')]),
            div(
              classes: 'contrib-day-label',
              [Component.text(content.contribDayLabels[1])],
            ),
            div(classes: 'contrib-day-label', [Component.text('')]),
            div(
              classes: 'contrib-day-label',
              [Component.text(content.contribDayLabels[2])],
            ),
            div(classes: 'contrib-day-label', [Component.text('')]),
          ]),

          // Month labels and Day Cells grid
          div(classes: 'contrib-grid-columns-box', [
            div(
              classes: 'contrib-months-row',
              _buildMonthLabels(weeks, content),
            ),
            div(
              classes: 'contrib-weeks-row',
              attributes: {
                'role': 'grid',
                'aria-label': content.sectionContributions,
              },
              events: {'mouseleave': (_) => _clearInspected()},
              [
                for (final week in weeks)
                  div(
                    classes: 'contrib-week-column',
                    attributes: {'role': 'row'},
                    [
                      for (final day in week) _buildContribCell(day, content),
                    ],
                  ),
              ],
            ),
          ]),
        ]),
      ]),

      // Inspector bar + Legend
      div(classes: 'graph-footer-row', [
        div(
          classes:
              'graph-inspector-bar${_inspectedText != null ? ' is-active' : ''}',
          attributes: {'aria-live': 'polite'},
          [Component.text(_inspectedText ?? content.contribInspectHint)],
        ),
        div(classes: 'graph-legend-row', [
          Component.text(content.contributionsLess),
          for (var l = 0; l <= 4; l++)
            () {
              final levelLabel = _legendLevelLabel(l);
              return div(
                classes: 'legend-box',
                attributes: {
                  'data-level': '$l',
                  'role': 'img',
                  'title': levelLabel,
                  'aria-label': levelLabel,
                },
                [
                  span(classes: 'sr-only', [Component.text(levelLabel)]),
                ],
              );
            }(),
          Component.text(content.contributionsMore),
        ]),
      ]),
    ];
  }

  Component _buildContribCell(
    Map<String, dynamic> day,
    PortfolioContent content,
  ) {
    final summary = _formatDaySummary(
      day['count'] as int,
      day['date'] as DateTime,
      content,
    );
    return div(
      classes: 'contrib-cell',
      attributes: {
        'data-level': '${day['level']}',
        'tabindex': '0',
        'role': 'gridcell',
        'title': summary,
        'aria-label': summary,
      },
      events: {
        'mouseenter': (_) => _setInspected(summary),
        'focus': (_) => _setInspected(summary),
        'blur': (_) => _clearInspected(),
      },
      [],
    );
  }

  List<Component> _buildMonthLabels(
    List<List<Map<String, dynamic>>> weeks,
    PortfolioContent content,
  ) {
    final labels = <Component>[];
    String? lastMonth;

    for (var i = 0; i < weeks.length; i++) {
      final week = weeks[i];
      if (week.isEmpty) continue;
      final date = week.first['date'] as DateTime;
      final monthName = _monthAbbr(date.month, content);
      if (monthName != lastMonth) {
        lastMonth = monthName;
        labels.add(
          span(
            classes: 'contrib-month-label',
            styles: Styles(raw: {
              'left': '${i * 14}px',
            }),
            [Component.text(monthName)],
          ),
        );
      }
    }
    return labels;
  }
}
