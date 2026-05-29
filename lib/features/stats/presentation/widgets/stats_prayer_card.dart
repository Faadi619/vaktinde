import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../widgets/app_surface_card.dart';
import 'stats_prayer_grid_cell.dart';
import 'stats_section_pill.dart';

class StatsPrayerCardData {
  final String name;
  final String iconAsset;
  final int completed;
  final int total;
  final String? countTextOverride;

  const StatsPrayerCardData({
    required this.name,
    required this.iconAsset,
    required this.completed,
    required this.total,
    this.countTextOverride,
  });

  int get percent => total == 0 ? 0 : ((completed / total) * 100).round();
  String get countText => countTextOverride ?? '$completed/$total';
}

class StatsPrayerCard extends StatelessWidget {
  final String title;
  final String? titleSuffix;
  final String? pillLabel;
  final List<StatsPrayerCardData> prayers;
  final VoidCallback? onPillTap;

  /// Percent threshold at or above which a cell is rendered with the
  /// "highlighted" style (green text + green divider). Defaults to 100
  /// (only fully-complete weeks are highlighted).
  final int highlightThreshold;

  /// When false, the per-cell count text (e.g. "7/7") is hidden and the
  /// percent value is promoted to the big-number slot. Used by Yıllık.
  final bool showCountText;

  /// When true, the [titleSuffix] is rendered on its own line below the
  /// title (column layout). When false (default), suffix sits inline to the
  /// right of the title.
  final bool stackTitleSuffix;

  const StatsPrayerCard({
    super.key,
    required this.title,
    required this.prayers,
    this.titleSuffix,
    this.pillLabel,
    this.onPillTap,
    this.highlightThreshold = 100,
    this.showCountText = true,
    this.stackTitleSuffix = false,
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
            if (stackTitleSuffix && titleSuffix != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppTextStyles.titleMedium.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      if (pillLabel != null)
                        StatsSectionPill(
                          label: pillLabel!,
                          onTap: onPillTap ?? () {},
                        ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    titleSuffix!,
                    style: AppTextStyles.size12w500.copyWith(
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  if (titleSuffix != null) ...[
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        titleSuffix!,
                        style: AppTextStyles.size12w500.copyWith(
                          color: AppColors.mutedText,
                        ),
                      ),
                    ),
                  ],
                  if (pillLabel != null) ...[
                    const Spacer(),
                    StatsSectionPill(
                      label: pillLabel!,
                      onTap: onPillTap ?? () {},
                    ),
                  ],
                ],
              ),
            const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: prayers
                  .map(
                    (p) => Expanded(
                      child: StatsPrayerGridCell(
                        prayerName: p.name,
                        iconAsset: p.iconAsset,
                        countText: p.countText,
                        percent: p.percent,
                        highlightThreshold: highlightThreshold,
                        showCountText: showCountText,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
