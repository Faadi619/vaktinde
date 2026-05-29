import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

class PrayerCard extends StatefulWidget {
  const PrayerCard({super.key});

  @override
  State<PrayerCard> createState() => _PrayerCardState();
}

class _PrayerCardState extends State<PrayerCard> {
  // Sabah, Öğle, İkindi, Akşam, Yatsı
  final List<bool> _done = [true, false, false, false, false];

  void _toggle(int i) => setState(() => _done[i] = !_done[i]);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          PrayerRow(
            name: 'Sabah',
            iconAsset: AppAssets.fajrIcon,
            time: null,
            subLabel1: 'İmsak',
            subTime1: '04:25',
            subLabel2: 'Güneş',
            subTime2: '05:52',
            isDone: _done[0],
            onTap: () => _toggle(0),
            isLast: false,
          ),
          PrayerRow(
            name: 'Öğle',
            iconAsset: AppAssets.zuhrIcon,
            time: '12:45',
            isDone: _done[1],
            onTap: () => _toggle(1),
            isLast: false,
          ),
          PrayerRow(
            name: 'İkindi',
            iconAsset: AppAssets.asarIcon,
            time: '16:29',
            isDone: _done[2],
            onTap: () => _toggle(2),
            isLast: false,
          ),
          PrayerRow(
            name: 'Akşam',
            iconAsset: AppAssets.maghribIcon,
            time: '19:58',
            isDone: _done[3],
            onTap: () => _toggle(3),
            isLast: false,
          ),
          PrayerRow(
            name: 'Yatsı',
            iconAsset: AppAssets.ishaIcon,
            time: '21:30',
            isDone: _done[4],
            onTap: () => _toggle(4),
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class PrayerRow extends StatelessWidget {
  const PrayerRow({
    super.key,
    required this.name,
    required this.iconAsset,
    required this.time,
    required this.isDone,
    required this.onTap,
    required this.isLast,
    this.subLabel1,
    this.subTime1,
    this.subLabel2,
    this.subTime2,
  });

  final String name;
  final String iconAsset;
  final String? time;
  final bool isDone;
  final VoidCallback onTap;
  final bool isLast;
  final String? subLabel1;
  final String? subTime1;
  final String? subLabel2;
  final String? subTime2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: time == null ? 72 : 71,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.lightGreen,
                      width: 1.5,
                    ),
                  ),
                  child: Image.asset(iconAsset, fit: BoxFit.contain),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.size16w700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (subLabel1 != null)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  AppAssets.imsakClockIcon,
                                  width: 13,
                                  height: 13,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  subLabel1!,
                                  style: AppTextStyles.overline.copyWith(
                                    color: AppColors.primaryGreen,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  subTime1!,
                                  style: AppTextStyles.overline.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.mutedText,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  AppAssets.sunIcon,
                                  width: 13,
                                  height: 13,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  subLabel2!,
                                  style: AppTextStyles.overline.copyWith(
                                    color: AppColors.primaryGreen,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  subTime2!,
                                  style: AppTextStyles.overline.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.mutedText,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      else if (time != null)
                        Text(
                          time!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.size15w500.copyWith(
                            color: AppColors.mutedText,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                MarkButton(isDone: isDone, onTap: onTap),
              ],
            ),
          ),
        ),
        if (!isLast)
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.rowDivider,
            indent: 16,
            endIndent: 16,
          ),
      ],
    );
  }
}

class MarkButton extends StatelessWidget {
  const MarkButton({super.key, required this.isDone, required this.onTap});

  final bool isDone;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isDone
          ? Container(
              height: 41,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                '✓ Kılındı',
                style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.primaryGreen,
                ),
              ),
            )
          : Container(
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryGreen, width: 2),
              ),
              alignment: Alignment.center,
              child: Text(
                'Kıldım',
                style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.primaryGreen,
                ),
              ),
            ),
    );
  }
}
