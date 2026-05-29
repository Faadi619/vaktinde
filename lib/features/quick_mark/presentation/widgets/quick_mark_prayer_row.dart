import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../domain/prayer_mark_state.dart';
import 'quick_mark_kaza_button.dart';
import 'quick_mark_on_time_button.dart';

class QuickMarkPrayerRow extends StatelessWidget {
  final String prayerName;
  final String iconAsset;
  final String kazaLabel;
  final PrayerMarkState state;
  final bool showTopDivider;
  final ValueChanged<PrayerMarkState> onStateChanged;

  const QuickMarkPrayerRow({
    super.key,
    required this.prayerName,
    required this.iconAsset,
    required this.kazaLabel,
    required this.state,
    required this.onStateChanged,
    this.showTopDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      decoration: BoxDecoration(
        border: showTopDivider
            ? const Border(
                top: BorderSide(color: AppColors.rowDivider, width: 1),
              )
            : null,
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Image.asset(iconAsset, width: 40, height: 40),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              prayerName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.titleMedium,
            ),
          ),
          QuickMarkOnTimeButton(
            isChecked: state == PrayerMarkState.onTime,
            onTap: () => onStateChanged(
              state == PrayerMarkState.onTime
                  ? PrayerMarkState.unset
                  : PrayerMarkState.onTime,
            ),
          ),
          const SizedBox(width: 10),
          QuickMarkKazaButton(
            label: kazaLabel,
            isChecked: state == PrayerMarkState.kaza,
            onTap: () => onStateChanged(
              state == PrayerMarkState.kaza
                  ? PrayerMarkState.unset
                  : PrayerMarkState.kaza,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
