import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../widgets/app_toggle.dart';

class SpecialDayCard extends StatefulWidget {
  const SpecialDayCard({super.key});

  @override
  State<SpecialDayCard> createState() => _SpecialDayCardState();
}

class _SpecialDayCardState extends State<SpecialDayCard> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 12,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 13),
          Image.asset(AppAssets.specialDayIcon, width: 44, height: 44),
          const SizedBox(width: 16),
          const Text(
            'Özel gün modu',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.bodyText,
            ),
          ),
          const Spacer(),
          AppToggle(
            value: _active,
            onChanged: (v) => setState(() => _active = v),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
