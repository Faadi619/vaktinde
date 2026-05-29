import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../l10n/app_localizations.dart';
import 'tabs/monthly_tab.dart';
import 'tabs/overview_tab.dart';
import 'tabs/weekly_tab.dart';
import 'tabs/yearly_tab.dart';
import 'widgets/stats_page_header.dart';
import 'widgets/stats_tab_bar.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int _activeTab = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final tabLabels = [
      l10n.statsTabOverview,
      l10n.statsTabWeekly,
      l10n.statsTabMonthly,
      l10n.statsTabYearly,
    ];
    final tabViews = const [
      OverviewTab(),
      WeeklyTab(),
      MonthlyTab(),
      YearlyTab(),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StatsPageHeader(
              title: l10n.statsTitle,
              subtitle: l10n.statsSubtitle,
              onCalendarTap: () {},
            ),
            const SizedBox(height: 6),
            StatsTabBar(
              labels: tabLabels,
              activeIndex: _activeTab,
              onTabSelected: (index) => setState(() => _activeTab = index),
            ),
            Expanded(child: tabViews[_activeTab]),
          ],
        ),
      ),
    );
  }
}
