import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../widgets/app_surface_card.dart';
import 'stats_ring_chart.dart';
import 'stats_week_dots.dart';

class StatsHeroCard extends StatelessWidget {
  final String kicker;
  final String streakText;
  final String subtitle;
  final double ringPercent;
  final String? ringKicker;
  final String ringCaption;
  final List<bool> weekEngagement;
  final int todayIndex;

  const StatsHeroCard({
    super.key,
    required this.kicker,
    required this.streakText,
    required this.subtitle,
    required this.ringPercent,
    required this.ringCaption,
    required this.weekEngagement,
    required this.todayIndex,
    this.ringKicker,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppSurfaceCard(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kicker,
                    style: AppTextStyles.size12w500.copyWith(
                      color: const Color(0xFF888888),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.statsHeroStreak,
                        width: 46,
                        height: 46,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              streakText,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: AppTextStyles.displayMedium.copyWith(
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              subtitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: AppTextStyles.caption.copyWith(
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  StatsWeekDots(
                    engagement: weekEngagement,
                    todayIndex: todayIndex,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            StatsRingChart(
              percent: ringPercent,
              kicker: ringKicker,
              caption: ringCaption,
            ),
          ],
        ),
      ),
    );
  }
}
