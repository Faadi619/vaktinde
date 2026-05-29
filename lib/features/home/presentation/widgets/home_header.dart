import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        children: [
          Image.asset(AppAssets.locationIcon, width: 40, height: 40),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'İstanbul',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.size16w700.copyWith(fontSize: 17),
                ),
                Text(
                  _todayLabel(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => context.go('/profile'),
            child: Image.asset(AppAssets.editIcon, width: 22, height: 22),
          ),
        ],
      ),
    );
  }

  String _todayLabel() {
    final now = DateTime.now();
    const months = [
      'Ocak',
      'Şubat',
      'Mart',
      'Nisan',
      'Mayıs',
      'Haziran',
      'Temmuz',
      'Ağustos',
      'Eylül',
      'Ekim',
      'Kasım',
      'Aralık',
    ];
    const days = [
      'Pazartesi',
      'Salı',
      'Çarşamba',
      'Perşembe',
      'Cuma',
      'Cumartesi',
      'Pazar',
    ];
    final weekday = days[now.weekday - 1];
    final month = months[now.month - 1];
    return '${now.day} $month ${now.year} · $weekday';
  }
}
