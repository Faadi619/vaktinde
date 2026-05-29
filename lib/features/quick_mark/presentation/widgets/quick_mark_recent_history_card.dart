import 'package:flutter/material.dart';

import '../../../../widgets/app_surface_card.dart';

class QuickMarkRecentHistoryCard extends StatelessWidget {
  final List<Widget> entries;

  const QuickMarkRecentHistoryCard({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppSurfaceCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: entries,
        ),
      ),
    );
  }
}
