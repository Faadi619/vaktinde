import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../widgets/app_surface_card.dart';

class QuickMarkCard extends StatelessWidget {
  final String onTimeColumnLabel;
  final String kazaColumnLabel;
  final List<Widget> prayerRows;

  const QuickMarkCard({
    super.key,
    required this.onTimeColumnLabel,
    required this.kazaColumnLabel,
    required this.prayerRows,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppSurfaceCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 16),
                  const SizedBox(width: 40 + 10),
                  const Expanded(child: SizedBox.shrink()),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 56,
                      maxWidth: 100,
                    ),
                    child: Text(
                      onTimeColumnLabel,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: AppTextStyles.size12w700.copyWith(
                        height: 1.25,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 80,
                      maxWidth: 110,
                    ),
                    child: Text(
                      kazaColumnLabel,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: AppTextStyles.size12w700.copyWith(
                        height: 1.25,
                        color: AppColors.amber,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            ...prayerRows,
          ],
        ),
      ),
    );
  }
}
