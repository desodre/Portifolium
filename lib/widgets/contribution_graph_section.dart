import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../data/portfolio_data.dart';
import '../main.dart';
import '../theme/app_theme.dart';
import 'section_title.dart';

class ContributionGraphSection extends StatefulWidget {
  const ContributionGraphSection({super.key});

  @override
  State<ContributionGraphSection> createState() => _ContributionGraphSectionState();
}

class _ContributionGraphSectionState extends State<ContributionGraphSection> {
  AllContributions? _data;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchContributions();
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

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: languageNotifier,
      builder: (context, lang, _) {
        final content = kContent[lang]!;
        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 768;
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 40,
                vertical: isMobile ? 60 : 80,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(
                        title: content.sectionContributions,
                        subtitle: content.sectionContributionsSubtitle,
                      ),
                      const SizedBox(height: 32),
                      if (_loading)
                        _buildPlaceholder(context)
                      else if (_error != null)
                        _buildError(context)
                      else
                        _buildGraph(context, content, _data!),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return _GraphCard(
      context: context,
      child: const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context) {
    return _GraphCard(
      context: context,
      child: Center(
        child: Text(
          'Could not load contributions',
          style: GoogleFonts.inter(
            color: AppColors.textSecondaryMode(context),
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildGraph(BuildContext context, PortfolioContent content, AllContributions data) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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

    return _GraphCard(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$totalCount ${content.contributionsInLastYear}',
            style: GoogleFonts.inter(
              color: AppColors.textPrimaryMode(context),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _ContributionGrid(
              weeks: weeks,
              isDark: isDark,
              context: context,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                content.contributionsLess,
                style: GoogleFonts.inter(
                  color: AppColors.textSecondaryMode(context),
                  fontSize: 11,
                ),
              ),
              const SizedBox(width: 4),
              ...List.generate(
                5,
                (i) => Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Container(
                    width: 11,
                    height: 11,
                    decoration: BoxDecoration(
                      color: _levelColor(i, isDark),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                content.contributionsMore,
                style: GoogleFonts.inter(
                  color: AppColors.textSecondaryMode(context),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Returns the Sunday that is at most 52 weeks before [today].
  DateTime _getStartSunday(DateTime today) {
    var start = today.subtract(const Duration(days: 52 * 7));
    // DateTime.weekday: 1=Mon … 7=Sun. (weekday % 7) gives days to subtract to reach Sunday.
    final daysBack = start.weekday % 7;
    return start.subtract(Duration(days: daysBack));
  }

  List<List<_DayCell>> _buildWeeks(
    DateTime startSunday,
    DateTime today,
    Map<String, Contribution> map,
  ) {
    final weeks = <List<_DayCell>>[];
    var weekStart = startSunday;

    while (!weekStart.isAfter(today)) {
      final week = <_DayCell>[];
      for (var d = 0; d < 7; d++) {
        final day = weekStart.add(Duration(days: d));
        if (day.isAfter(today)) break;
        final key =
            '${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';
        final c = map[key];
        week.add(_DayCell(date: day, level: c?.level ?? 0, count: c?.count ?? 0));
      }
      weeks.add(week);
      weekStart = weekStart.add(const Duration(days: 7));
    }

    return weeks;
  }
}

// ---------------------------------------------------------------------------
// Card wrapper
// ---------------------------------------------------------------------------

class _GraphCard extends StatelessWidget {
  final BuildContext context;
  final Widget child;

  const _GraphCard({required this.context, required this.child});

  @override
  Widget build(BuildContext ctx) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceMode(ctx),
        border: Border.all(color: AppColors.borderMode(ctx)),
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: const BoxConstraints(minHeight: 140),
      child: child,
    );
  }
}

// ---------------------------------------------------------------------------
// Grid
// ---------------------------------------------------------------------------

class _ContributionGrid extends StatelessWidget {
  final List<List<_DayCell>> weeks;
  final bool isDark;
  final BuildContext context;

  static const double _cell = 11;
  static const double _gap = 3;
  static const double _dayLabelWidth = 30;

  const _ContributionGrid({
    required this.weeks,
    required this.isDark,
    required this.context,
  });

  @override
  Widget build(BuildContext ctx) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Day-of-week labels: Sun(hidden), Mon, Tue(hidden), Wed, Thu(hidden), Fri, Sat(hidden)
        SizedBox(
          width: _dayLabelWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Spacer for month labels row
              const SizedBox(height: 16),
              ..._buildDayLabels(ctx),
            ],
          ),
        ),
        const SizedBox(width: 4),
        // Month labels + week columns
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Month labels (Stack-based, no wrapping)
            ..._buildMonthLabels(ctx),
            const SizedBox(height: 4),
            // Week columns
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: weeks.map((w) => _buildWeekColumn(ctx, w)).toList(),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildDayLabels(BuildContext ctx) {
    // Rows: 0=Sun 1=Mon 2=Tue 3=Wed 4=Thu 5=Fri 6=Sat
    const labels = ['', 'Mon', '', 'Wed', '', 'Fri', ''];
    return labels
        .map(
          (label) => SizedBox(
            height: _cell + _gap,
            child: label.isEmpty
                ? null
                : Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      label,
                      style: GoogleFonts.inter(
                        color: AppColors.textSecondaryMode(ctx),
                        fontSize: 10,
                      ),
                    ),
                  ),
          ),
        )
        .toList();
  }

  List<Widget> _buildMonthLabels(BuildContext ctx) {
    // Use a Stack so labels are not constrained to one cell width.
    final totalWidth = weeks.length * (_cell + _gap);
    final positioned = <Widget>[];
    String? lastMonth;

    for (var i = 0; i < weeks.length; i++) {
      final week = weeks[i];
      if (week.isEmpty) continue;
      final monthName = _monthAbbr(week.first.date.month);
      if (monthName != lastMonth) {
        lastMonth = monthName;
        positioned.add(
          Positioned(
            left: i * (_cell + _gap),
            top: 0,
            child: Text(
              monthName,
              style: GoogleFonts.inter(
                color: AppColors.textSecondaryMode(ctx),
                fontSize: 11,
              ),
            ),
          ),
        );
      }
    }

    return [
      SizedBox(
        height: 16,
        width: totalWidth,
        child: Stack(clipBehavior: Clip.none, children: positioned),
      ),
    ];
  }

  Widget _buildWeekColumn(BuildContext ctx, List<_DayCell> week) {
    final cells = List.generate(7, (row) {
      final cell = row < week.length ? week[row] : null;
      return Padding(
        padding: const EdgeInsets.only(bottom: _gap),
        child: cell == null
            ? SizedBox(width: _cell, height: _cell)
            : Tooltip(
                message: cell.count == 0
                    ? 'No contributions on ${_formatDate(cell.date)}'
                    : '${cell.count} contribution${cell.count == 1 ? '' : 's'} on ${_formatDate(cell.date)}',
                child: Container(
                  width: _cell,
                  height: _cell,
                  decoration: BoxDecoration(
                    color: _levelColor(cell.level, isDark),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
      );
    });

    return Padding(
      padding: const EdgeInsets.only(right: _gap),
      child: Column(children: cells),
    );
  }

  static String _monthAbbr(int month) {
    const m = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return m[month - 1];
  }

  static String _formatDate(DateTime d) => '${_monthAbbr(d.month)} ${d.day}, ${d.year}';
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

class _DayCell {
  final DateTime date;
  final int level;
  final int count;

  const _DayCell({required this.date, required this.level, required this.count});
}

Color _levelColor(int level, bool isDark) {
  if (isDark) {
    switch (level) {
      case 1:
        return const Color(0xFF0E4429);
      case 2:
        return const Color(0xFF006D32);
      case 3:
        return const Color(0xFF26A641);
      case 4:
        return const Color(0xFF39D353);
      default:
        return const Color(0xFF21262D); // visible against darkSurface (0xFF161B22)
    }
  } else {
    switch (level) {
      case 1:
        return const Color(0xFF9BE9A8);
      case 2:
        return const Color(0xFF40C463);
      case 3:
        return const Color(0xFF30A14E);
      case 4:
        return const Color(0xFF216E39);
      default:
        return const Color(0xFFEBEDF0);
    }
  }
}
