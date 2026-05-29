import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/assets.dart';
import '../../../core/constants/colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../auth/providers/auth_provider.dart';
import 'widgets/profile_logout_button.dart';
import 'widgets/profile_menu_row.dart';
import 'widgets/profile_menu_section.dart';
import 'widgets/profile_page_header.dart';
import 'widgets/profile_stat_cell.dart';
import 'widgets/profile_summary_card.dart';
import 'widgets/profile_tag.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.user;
    final firebaseUser = authProvider.firebaseUser;

    final displayName = user?.displayName.isNotEmpty == true
        ? user!.displayName
        : (firebaseUser?.displayName?.isNotEmpty == true
              ? firebaseUser!.displayName!
              : '');
    final email = user?.email.isNotEmpty == true
        ? user!.email
        : (firebaseUser?.email ?? '');

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 10, bottom: 32),
          children: [
            ProfilePageHeader(
              title: l10n.profileTitle,
              subtitle: l10n.profileSubtitle,
            ),
            const SizedBox(height: 20),
            ProfileSummaryCard(
              displayName: displayName,
              email: email,
              tags: [
                ProfileTag(
                  label: l10n.profileTagMuslim,
                  icon: Icons.eco_outlined,
                ),
                ProfileTag(
                  label: l10n.profileTagCountry,
                  icon: Icons.flag_outlined,
                ),
              ],
              stats: [
                ProfileStatCell(
                  iconAsset: AppAssets.profileStatStreak,
                  value: '318',
                  label: l10n.profileStatConsistentDays,
                ),
                ProfileStatCell(
                  iconAsset: AppAssets.profileStatTrophy,
                  value: '29',
                  label: l10n.profileStatLongestStreak,
                ),
                ProfileStatCell(
                  iconAsset: AppAssets.profileStatPrayers,
                  value: '2.2',
                  label: l10n.profileStatTotalPrayers,
                ),
                ProfileStatCell(
                  iconAsset: AppAssets.profileStatPercent,
                  value: '%87',
                  label: l10n.profileStatAverageRate,
                  showTrailingDivider: false,
                ),
              ],
              onEditTap: () {},
            ),
            const SizedBox(height: 28),
            ProfileMenuSection(
              label: l10n.profileSectionAccount,
              rows: [
                ProfileMenuRow(
                  iconAsset: AppAssets.profileMenuPersonal,
                  title: l10n.profileMenuPersonalTitle,
                  subtitle: l10n.profileMenuPersonalSubtitle,
                  onTap: () {},
                ),
                ProfileMenuRow(
                  iconAsset: AppAssets.profileMenuPassword,
                  title: l10n.profileMenuPasswordTitle,
                  subtitle: l10n.profileMenuPasswordSubtitle,
                  onTap: () {},
                ),
                ProfileMenuRow(
                  iconAsset: AppAssets.profileMenuNotifications,
                  title: l10n.profileMenuNotificationsTitle,
                  subtitle: l10n.profileMenuNotificationsSubtitle,
                  onTap: () {},
                ),
                ProfileMenuRow(
                  iconAsset: AppAssets.profileMenuAppSettings,
                  title: l10n.profileMenuAppSettingsTitle,
                  subtitle: l10n.profileMenuAppSettingsSubtitle,
                  showBottomDivider: false,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            ProfileMenuSection(
              label: l10n.profileSectionWorship,
              rows: [
                ProfileMenuRow(
                  iconAsset: AppAssets.profileMenuPrayerTimes,
                  title: l10n.profileMenuPrayerTimesTitle,
                  subtitle: l10n.profileMenuPrayerTimesSubtitle,
                  onTap: () {},
                ),
                ProfileMenuRow(
                  iconAsset: AppAssets.profileMenuQibla,
                  title: l10n.profileMenuQiblaTitle,
                  subtitle: l10n.profileMenuQiblaSubtitle,
                  onTap: () {},
                ),
                ProfileMenuRow(
                  iconAsset: AppAssets.profileMenuQuickMark,
                  title: l10n.profileMenuQuickMarkTitle,
                  subtitle: l10n.profileMenuQuickMarkSubtitle,
                  onTap: () {},
                ),
                ProfileMenuRow(
                  iconAsset: AppAssets.profileMenuKazaReminder,
                  title: l10n.profileMenuKazaReminderTitle,
                  subtitle: l10n.profileMenuKazaReminderSubtitle,
                  showBottomDivider: false,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            ProfileMenuSection(
              label: l10n.profileSectionOther,
              rows: [
                ProfileMenuRow(
                  iconAsset: AppAssets.profileMenuBackup,
                  title: l10n.profileMenuBackupTitle,
                  subtitle: l10n.profileMenuBackupSubtitle,
                  onTap: () {},
                ),
                ProfileMenuRow(
                  iconAsset: AppAssets.profileMenuAbout,
                  title: l10n.profileMenuAboutTitle,
                  subtitle: l10n.profileMenuAboutSubtitle,
                  onTap: () {},
                ),
                ProfileMenuRow(
                  iconAsset: AppAssets.profileMenuHelp,
                  title: l10n.profileMenuHelpTitle,
                  subtitle: l10n.profileMenuHelpSubtitle,
                  onTap: () {},
                ),
                ProfileMenuRow(
                  iconAsset: AppAssets.profileMenuPrivacy,
                  title: l10n.profileMenuPrivacyTitle,
                  subtitle: l10n.profileMenuPrivacySubtitle,
                  showBottomDivider: false,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            ProfileLogoutButton(
              label: l10n.profileSignOut,
              isLoading: authProvider.isLoading,
              onTap: () => context.read<AuthProvider>().signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
