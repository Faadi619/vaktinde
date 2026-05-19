import 'package:flutter/material.dart';

import 'package:vaqt/core/constants/colors.dart';
import 'package:vaqt/widgets/app_surface_card.dart';

class QiblaLocationCard extends StatelessWidget {
  const QiblaLocationCard({
    required this.cityText,
    required this.locationModeLabel,
    required this.onRefreshTap,
    super.key,
  });

  final String cityText;
  final String locationModeLabel;
  final VoidCallback onRefreshTap;

  @override
  Widget build(BuildContext context) {
    return AppSurfaceCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: AppColors.lightGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.location_on_outlined,
              color: AppColors.primaryGreen,
              size: 19,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: AppColors.bodyText,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      locationModeLabel,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.gps_fixed,
                      color: AppColors.primaryGreen,
                      size: 13,
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onRefreshTap,
            child: Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: AppColors.lightGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.my_location,
                color: AppColors.primaryGreen,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
