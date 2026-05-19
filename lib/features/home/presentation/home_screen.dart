import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import 'widgets/hero_card.dart';
import 'widgets/home_header.dart';
import 'widgets/prayer_card.dart';
import 'widgets/special_day_card.dart';
import 'widgets/streak_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeHeader(),
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    HeroCard(),
                    SizedBox(height: 12),
                    StreakCard(),
                    SizedBox(height: 12),
                    PrayerCard(),
                    SizedBox(height: 12),
                    SpecialDayCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
