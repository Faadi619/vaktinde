import 'package:flutter/material.dart';

import '../../../../core/constants/text_styles.dart';
import '../../../../widgets/app_surface_card.dart';
import 'profile_menu_row.dart';

/// A profile section: a small label header above a white rounded card
/// containing [ProfileMenuRow]s with dividers between them.
class ProfileMenuSection extends StatelessWidget {
  final String label;
  final List<ProfileMenuRow> rows;

  const ProfileMenuSection({
    super.key,
    required this.label,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 0, 8),
            child: Text(
              label,
              style: AppTextStyles.size13w700,
            ),
          ),
          AppSurfaceCard(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: rows,
            ),
          ),
        ],
      ),
    );
  }
}
