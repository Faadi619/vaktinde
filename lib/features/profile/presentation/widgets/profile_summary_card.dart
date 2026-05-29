import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../widgets/app_surface_card.dart';
import 'profile_avatar.dart';
import 'profile_stat_cell.dart';
import 'profile_tag.dart';

class ProfileSummaryCard extends StatelessWidget {
  final String displayName;
  final String email;
  final List<ProfileTag> tags;
  final List<ProfileStatCell> stats;
  final VoidCallback? onEditTap;

  const ProfileSummaryCard({
    super.key,
    required this.displayName,
    required this.email,
    required this.tags,
    required this.stats,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppSurfaceCard(
        padding: const EdgeInsets.fromLTRB(12, 18, 12, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileAvatar(),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.h3.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.caption,
                      ),
                      const SizedBox(height: 8),
                      Wrap(spacing: 6, runSpacing: 6, children: tags),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onEditTap,
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: SvgPicture.asset(
                      AppAssets.profileEdit,
                      width: 16,
                      height: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.rowDivider, width: 1),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(stats.length, (i) {
                    return Expanded(child: stats[i]);
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
