import 'package:flutter/material.dart';

import '../../../../core/constants/text_styles.dart';
import '../../../../widgets/app_surface_card.dart';
import 'stats_summary_row.dart';

class StatsSummaryCard extends StatelessWidget {
  final String title;
  final List<StatsSummaryRow> rows;

  const StatsSummaryCard({super.key, required this.title, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppSurfaceCard(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            ...rows,
          ],
        ),
      ),
    );
  }
}
