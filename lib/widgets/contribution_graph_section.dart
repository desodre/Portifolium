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

  @override
  void initState() {
    super.initState();
    // Only fetch contribution data on the client browser
    if (kIsWeb) {
      _fetchContributions();
    }
  }

  Future<void> _fetchContributions() async {
    try {
      final uri = Uri.parse('$apiBaseContributions?y=last');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        setState(() {
          _data = AllContributions.fromJson(json);
          _loading = false;
        });
      } else {
        setState(() {
          _error = 'HTTP ${response.statusCode}';
          _loading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
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

  static String _monthAbbr(int month) {
    const m = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return m[month - 1];
  }

  static String _formatDate(DateTime d) =>
      '${_monthAbbr(d.month)} ${d.day}, ${d.year}';

  @override
  Component build(BuildContext context) {
    final content = kContent[component.lang]!;

    return div(classes: 'section-padding container-box', [
      SectionTitle(
        title: content.sectionContributions,
        subtitle: content.sectionContributionsSubtitle,
      ),
      div(classes: 'graph-card', [
        if (_loading)
          div(classes: 'avail-dot', []) // Circular loader styled as pulsing dot
        else if (_error != null)
          p(classes: 'section-subtitle-text', [
            Component.text(component.lang == 'pt'
                ? 'Não foi possível carregar as contribuições: $_error'
                : 'Could not load contributions: $_error')
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
      div(classes: 'graph-title', [
        Component.text('$totalCount ${content.contributionsInLastYear}'),
      ]),

      div(classes: 'graph-scroll-container', [
        div(classes: 'contrib-grid-wrapper', [
          // Days column labels
          div(classes: 'contrib-days-labels', [
            div(classes: 'contrib-day-label', [Component.text('')]),
            div(classes: 'contrib-day-label', [Component.text('Mon')]),
            div(classes: 'contrib-day-label', [Component.text('')]),
            div(classes: 'contrib-day-label', [Component.text('Wed')]),
            div(classes: 'contrib-day-label', [Component.text('')]),
            div(classes: 'contrib-day-label', [Component.text('Fri')]),
            div(classes: 'contrib-day-label', [Component.text('')]),
          ]),

          // Month labels and Day Cells grid
          div(classes: 'contrib-grid-columns-box', [
            div(classes: 'contrib-months-row', _buildMonthLabels(weeks)),
            div(classes: 'contrib-weeks-row', [
              for (final week in weeks)
                div(classes: 'contrib-week-column', [
                  for (final day in week)
                    div(
                      classes: 'contrib-cell',
                      attributes: {'data-level': '${day['level']}'},
                      [
                        span(classes: 'tooltip-text', [
                          Component.text(day['count'] == 0
                              ? 'No contributions on ${_formatDate(day['date'] as DateTime)}'
                              : '${day['count']} contribution${day['count'] == 1 ? '' : 's'} on ${_formatDate(day['date'] as DateTime)}'),
                        ]),
                      ],
                    ),
                ]),
            ]),
          ]),
        ]),
      ]),

      // Legend
      div(classes: 'graph-legend-row', [
        Component.text(content.contributionsLess),
        for (var l = 0; l <= 4; l++)
          div(
            classes: 'legend-box',
            attributes: {'data-level': '$l'},
            [],
          ),
        Component.text(content.contributionsMore),
      ]),
    ];
  }

  List<Component> _buildMonthLabels(List<List<Map<String, dynamic>>> weeks) {
    final labels = <Component>[];
    String? lastMonth;

    for (var i = 0; i < weeks.length; i++) {
      final week = weeks[i];
      if (week.isEmpty) continue;
      final date = week.first['date'] as DateTime;
      final monthName = _monthAbbr(date.month);
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
