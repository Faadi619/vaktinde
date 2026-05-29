import 'package:flutter/material.dart';

import '../../../../core/constants/text_styles.dart';
import '../../../../widgets/app_surface_card.dart';
import 'stats_insight_cell.dart';

class StatsInsightsCard extends StatelessWidget {
  final String title;
  final List<StatsInsightCell> insights;

  const StatsInsightsCard({
    super.key,
    required this.title,
    required this.insights,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppSurfaceCard(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 14),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(insights.length, (index) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: index == insights.length - 1 ? 0 : 8,
                      ),
                      child: insights[index],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
