import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/assets.dart';
import '../../../core/constants/colors.dart';
import '../../../l10n/app_localizations.dart';
import '../domain/prayer_mark_state.dart';
import 'widgets/quick_mark_card.dart';
import 'widgets/quick_mark_date_navigator.dart';
import 'widgets/quick_mark_header.dart';
import 'widgets/quick_mark_info_banner.dart';
import 'widgets/quick_mark_note_card.dart';
import 'widgets/quick_mark_prayer_row.dart';
import 'widgets/quick_mark_recent_entry.dart';
import 'widgets/quick_mark_recent_history_card.dart';
import 'widgets/quick_mark_save_button.dart';
import 'widgets/quick_mark_section_header.dart';

class QuickMarkScreen extends StatefulWidget {
  const QuickMarkScreen({super.key});

  @override
  State<QuickMarkScreen> createState() => _QuickMarkScreenState();
}

class _QuickMarkScreenState extends State<QuickMarkScreen> {
  DateTime _selectedDate = DateTime.now();
  final Map<String, PrayerMarkState> _markStates = {
    'fajr': PrayerMarkState.unset,
    'dhuhr': PrayerMarkState.unset,
    'asr': PrayerMarkState.unset,
    'maghrib': PrayerMarkState.unset,
    'isha': PrayerMarkState.unset,
  };

  void _setPrayerState(String key, PrayerMarkState newState) {
    setState(() {
      _markStates[key] = newState;
    });
  }

  void _shiftDate(int days) {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: days));
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dateText = DateFormat('d MMMM yyyy EEEE', 'tr').format(_selectedDate);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              QuickMarkHeader(
                title: l10n.quickMarkTitle,
                subtitle: l10n.quickMarkSubtitle,
                infoButtonLabel: l10n.quickMarkInfoButton,
                onInfoTap: () {},
              ),
              const SizedBox(height: 18),
              QuickMarkDateNavigator(
                dateText: dateText,
                onPreviousTap: () => _shiftDate(-1),
                onNextTap: () => _shiftDate(1),
                onDatePillTap: () {},
              ),
              const SizedBox(height: 18),
              QuickMarkInfoBanner(message: l10n.quickMarkInfoBannerBody),
              const SizedBox(height: 16),
              QuickMarkCard(
                onTimeColumnLabel: l10n.quickMarkColumnOnTime,
                kazaColumnLabel: l10n.quickMarkColumnKaza,
                prayerRows: [
                  QuickMarkPrayerRow(
                    prayerName: l10n.prayerFajr,
                    iconAsset: AppAssets.fajrIcon,
                    kazaLabel: l10n.prayerKaza,
                    state: _markStates['fajr']!,
                    showTopDivider: false,
                    onStateChanged: (s) => _setPrayerState('fajr', s),
                  ),
                  QuickMarkPrayerRow(
                    prayerName: l10n.prayerDhuhr,
                    iconAsset: AppAssets.zuhrIcon,
                    kazaLabel: l10n.prayerKaza,
                    state: _markStates['dhuhr']!,
                    onStateChanged: (s) => _setPrayerState('dhuhr', s),
                  ),
                  QuickMarkPrayerRow(
                    prayerName: l10n.prayerAsr,
                    iconAsset: AppAssets.asarIcon,
                    kazaLabel: l10n.prayerKaza,
                    state: _markStates['asr']!,
                    onStateChanged: (s) => _setPrayerState('asr', s),
                  ),
                  QuickMarkPrayerRow(
                    prayerName: l10n.prayerMaghrib,
                    iconAsset: AppAssets.maghribIcon,
                    kazaLabel: l10n.prayerKaza,
                    state: _markStates['maghrib']!,
                    onStateChanged: (s) => _setPrayerState('maghrib', s),
                  ),
                  QuickMarkPrayerRow(
                    prayerName: l10n.prayerIsha,
                    iconAsset: AppAssets.ishaIcon,
                    kazaLabel: l10n.prayerKaza,
                    state: _markStates['isha']!,
                    onStateChanged: (s) => _setPrayerState('isha', s),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              QuickMarkNoteCard(
                title: l10n.quickMarkNoteTitle,
                subtitle: l10n.quickMarkNoteSubtitle,
                onTap: () {},
              ),
              const SizedBox(height: 14),
              QuickMarkSaveButton(
                label: l10n.quickMarkSaveButton,
                onTap: () {},
              ),
              const SizedBox(height: 18),
              QuickMarkSectionHeader(
                title: l10n.quickMarkRecentHistory,
                trailingLabel: l10n.quickMarkRecentSeeAll,
                onTrailingTap: () {},
              ),
              const SizedBox(height: 4),
              QuickMarkRecentHistoryCard(
                entries: [
                  QuickMarkRecentEntry(
                    dateText: DateFormat(
                      'd MMMM yyyy EEEE',
                      'tr',
                    ).format(DateTime.now().subtract(const Duration(days: 1))),
                    summaryText: l10n.quickMarkRecentKazaSuffix(
                      '${l10n.prayerFajr}, ${l10n.prayerDhuhr}',
                    ),
                    onTap: () {},
                  ),
                  QuickMarkRecentEntry(
                    dateText: DateFormat(
                      'd MMMM yyyy EEEE',
                      'tr',
                    ).format(DateTime.now().subtract(const Duration(days: 2))),
                    summaryText: l10n.quickMarkRecentKazaSuffix(
                      l10n.prayerIsha,
                    ),
                    showBottomDivider: false,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
