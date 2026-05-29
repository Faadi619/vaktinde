import 'package:flutter/material.dart';

import '../../../../core/constants/text_styles.dart';
import '../../../../widgets/app_surface_card.dart';
import 'stats_total_cell.dart';

class StatsTotalsCard extends StatelessWidget {
  final String title;
  final List<StatsTotalCell> cells;

  const StatsTotalsCard({super.key, required this.title, required this.cells});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppSurfaceCard(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: cells.map((c) => Expanded(child: c)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
