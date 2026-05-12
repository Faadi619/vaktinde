import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('tr')];

  /// Application name
  ///
  /// In tr, this message translates to:
  /// **'Vaktinde'**
  String get appName;

  /// Generic loading text
  ///
  /// In tr, this message translates to:
  /// **'Yükleniyor...'**
  String get loading;

  /// Generic save button
  ///
  /// In tr, this message translates to:
  /// **'Kaydet'**
  String get save;

  /// Generic cancel button
  ///
  /// In tr, this message translates to:
  /// **'İptal'**
  String get cancel;

  /// Generic close button
  ///
  /// In tr, this message translates to:
  /// **'Kapat'**
  String get close;

  /// Generic confirm button
  ///
  /// In tr, this message translates to:
  /// **'Onayla'**
  String get confirm;

  /// Retry button
  ///
  /// In tr, this message translates to:
  /// **'Tekrar Dene'**
  String get retry;

  /// Generic error message
  ///
  /// In tr, this message translates to:
  /// **'Bir hata oluştu. Lütfen tekrar deneyin.'**
  String get errorGeneric;

  /// No internet error
  ///
  /// In tr, this message translates to:
  /// **'İnternet bağlantısı yok. Kaydedilen veriler gösteriliyor.'**
  String get errorNoInternet;

  /// Location permission denied
  ///
  /// In tr, this message translates to:
  /// **'Konum izni reddedildi. Lütfen ayarlardan izin verin.'**
  String get errorLocationDenied;

  /// Google sign-in button
  ///
  /// In tr, this message translates to:
  /// **'Google ile Giriş Yap'**
  String get signInWithGoogle;

  /// Sign out button
  ///
  /// In tr, this message translates to:
  /// **'Çıkış Yap'**
  String get signOut;

  /// Welcome screen title
  ///
  /// In tr, this message translates to:
  /// **'Hoş Geldin'**
  String get welcomeTitle;

  /// Welcome screen subtitle
  ///
  /// In tr, this message translates to:
  /// **'Namaz alışkanlığını takip et, gücünü hisset.'**
  String get welcomeSubtitle;

  /// Location permission dialog title
  ///
  /// In tr, this message translates to:
  /// **'Konum İzni'**
  String get locationPermissionTitle;

  /// Location permission dialog message
  ///
  /// In tr, this message translates to:
  /// **'Namaz vakitlerini ve kıble yönünü doğru hesaplayabilmek için konumunuza ihtiyacımız var.'**
  String get locationPermissionMessage;

  /// Allow location button
  ///
  /// In tr, this message translates to:
  /// **'Konuma İzin Ver'**
  String get allowLocation;

  /// Manual city selection button
  ///
  /// In tr, this message translates to:
  /// **'Şehri Manuel Seç'**
  String get selectCityManually;

  /// Home tab label
  ///
  /// In tr, this message translates to:
  /// **'Ana Sayfa'**
  String get navHome;

  /// Statistics tab label
  ///
  /// In tr, this message translates to:
  /// **'İstatistikler'**
  String get navStats;

  /// Quick mark tab label
  ///
  /// In tr, this message translates to:
  /// **'Hızlı İşaretle'**
  String get navQuickMark;

  /// Qibla tab label
  ///
  /// In tr, this message translates to:
  /// **'Kıble'**
  String get navQibla;

  /// Profile tab label
  ///
  /// In tr, this message translates to:
  /// **'Profil'**
  String get navProfile;

  /// Fajr prayer name
  ///
  /// In tr, this message translates to:
  /// **'Sabah'**
  String get prayerFajr;

  /// Dhuhr prayer name
  ///
  /// In tr, this message translates to:
  /// **'Öğle'**
  String get prayerDhuhr;

  /// Asr prayer name
  ///
  /// In tr, this message translates to:
  /// **'İkindi'**
  String get prayerAsr;

  /// Maghrib prayer name
  ///
  /// In tr, this message translates to:
  /// **'Akşam'**
  String get prayerMaghrib;

  /// Isha prayer name
  ///
  /// In tr, this message translates to:
  /// **'Yatsı'**
  String get prayerIsha;

  /// Imsak time name
  ///
  /// In tr, this message translates to:
  /// **'İmsak'**
  String get prayerImsak;

  /// Sunrise time name
  ///
  /// In tr, this message translates to:
  /// **'Güneş'**
  String get prayerSunrise;

  /// On-time prayer label
  ///
  /// In tr, this message translates to:
  /// **'Vaktinde'**
  String get prayerOnTime;

  /// Makeup prayer label
  ///
  /// In tr, this message translates to:
  /// **'Kaza'**
  String get prayerKaza;

  /// Mark prayer as on time button
  ///
  /// In tr, this message translates to:
  /// **'Vaktinde Kıldım'**
  String get markAsOnTime;

  /// Mark prayer as kaza button
  ///
  /// In tr, this message translates to:
  /// **'Kaza Olarak Kıldım'**
  String get markAsKaza;

  /// Today's prayers section header
  ///
  /// In tr, this message translates to:
  /// **'Bugünün Namazları'**
  String get todayPrayers;

  /// Next prayer label
  ///
  /// In tr, this message translates to:
  /// **'Sonraki Namaz'**
  String get nextPrayer;

  /// Time remaining until next prayer
  ///
  /// In tr, this message translates to:
  /// **'{time} kaldı'**
  String remainingTime(String time);

  /// Special day mode toggle label
  ///
  /// In tr, this message translates to:
  /// **'Özel Gün Modu'**
  String get specialDayMode;

  /// Travel special day type
  ///
  /// In tr, this message translates to:
  /// **'Seyahat'**
  String get specialDayTravel;

  /// Illness special day type
  ///
  /// In tr, this message translates to:
  /// **'Hastalık'**
  String get specialDayIllness;

  /// Other special day type
  ///
  /// In tr, this message translates to:
  /// **'Diğer'**
  String get specialDayOther;

  /// Special day active banner
  ///
  /// In tr, this message translates to:
  /// **'Özel gün aktif: {type}'**
  String specialDayActive(String type);

  /// Streak day count
  ///
  /// In tr, this message translates to:
  /// **'{count} Gün Seri'**
  String streakDays(int count);

  /// Message shown after a streak freeze was auto-applied
  ///
  /// In tr, this message translates to:
  /// **'Dünkü seriniz bir mühlet günüyle korundu.'**
  String get streakFrozenMessage;

  /// Compassionate broken streak message
  ///
  /// In tr, this message translates to:
  /// **'Her gün yeni bir başlangıç. Geçmişin kayıtlarda, bugünden itibaren devam et.'**
  String get streakBrokenMessage;

  /// Re-engagement celebration after 3 days back
  ///
  /// In tr, this message translates to:
  /// **'3 günlük yeni seri! Devam ediyorsun.'**
  String get streakReengagementMessage;

  /// Streak freezes remaining label
  ///
  /// In tr, this message translates to:
  /// **'{count} mühlet gününüz kaldı'**
  String streakFreezesRemaining(int count);

  /// Best streak label
  ///
  /// In tr, this message translates to:
  /// **'En İyi Seri'**
  String get bestStreak;

  /// Total engagement days label
  ///
  /// In tr, this message translates to:
  /// **'Toplam Aktif Gün'**
  String get totalEngagementDays;

  /// Quick mark screen title
  ///
  /// In tr, this message translates to:
  /// **'Hızlı İşaretle'**
  String get quickMarkTitle;

  /// Quick mark save button
  ///
  /// In tr, this message translates to:
  /// **'Seçimleri Kaydet'**
  String get quickMarkSaveButton;

  /// Day note placeholder
  ///
  /// In tr, this message translates to:
  /// **'Gün notu (isteğe bağlı)'**
  String get quickMarkNote;

  /// Recent history section label
  ///
  /// In tr, this message translates to:
  /// **'Son İşaretlemeler'**
  String get quickMarkRecentHistory;

  /// Quick mark save success message
  ///
  /// In tr, this message translates to:
  /// **'Kaydedildi.'**
  String get quickMarkSavedSuccess;

  /// Statistics screen title
  ///
  /// In tr, this message translates to:
  /// **'İstatistikler'**
  String get statsTitle;

  /// Overview stats tab
  ///
  /// In tr, this message translates to:
  /// **'Genel Bakış'**
  String get statsTabOverview;

  /// Weekly stats tab
  ///
  /// In tr, this message translates to:
  /// **'Haftalık'**
  String get statsTabWeekly;

  /// Monthly stats tab
  ///
  /// In tr, this message translates to:
  /// **'Aylık'**
  String get statsTabMonthly;

  /// Yearly stats tab
  ///
  /// In tr, this message translates to:
  /// **'Yıllık'**
  String get statsTabYearly;

  /// Total prayers stat label
  ///
  /// In tr, this message translates to:
  /// **'Toplam Namaz'**
  String get statsTotalPrayers;

  /// Total days stat label
  ///
  /// In tr, this message translates to:
  /// **'Toplam Gün'**
  String get statsTotalDays;

  /// Completion rate stat label
  ///
  /// In tr, this message translates to:
  /// **'Tamamlanma Oranı'**
  String get statsCompletionRate;

  /// This week label
  ///
  /// In tr, this message translates to:
  /// **'Bu Hafta'**
  String get statsThisWeek;

  /// This month label
  ///
  /// In tr, this message translates to:
  /// **'Bu Ay'**
  String get statsThisMonth;

  /// This year label
  ///
  /// In tr, this message translates to:
  /// **'Bu Yıl'**
  String get statsThisYear;

  /// Best month label
  ///
  /// In tr, this message translates to:
  /// **'En İyi Ay'**
  String get statsBestMonth;

  /// Qibla screen title
  ///
  /// In tr, this message translates to:
  /// **'Kıble'**
  String get qiblaTitle;

  /// Qibla screen subtitle
  ///
  /// In tr, this message translates to:
  /// **'Kıble yönünü bul'**
  String get qiblaSubtitle;

  /// Qibla map button
  ///
  /// In tr, this message translates to:
  /// **'Harita'**
  String get qiblaMapButton;

  /// Degree value display
  ///
  /// In tr, this message translates to:
  /// **'{degrees}°'**
  String qiblaDegrees(String degrees);

  /// High accuracy label
  ///
  /// In tr, this message translates to:
  /// **'Yüksek'**
  String get qiblaAccuracyHigh;

  /// Medium accuracy label
  ///
  /// In tr, this message translates to:
  /// **'Orta'**
  String get qiblaAccuracyMedium;

  /// Low accuracy label
  ///
  /// In tr, this message translates to:
  /// **'Düşük'**
  String get qiblaAccuracyLow;

  /// Qibla instructions card title
  ///
  /// In tr, this message translates to:
  /// **'Nasıl Kullanılır?'**
  String get qiblaInstructionsTitle;

  /// Qibla instruction step 1
  ///
  /// In tr, this message translates to:
  /// **'Telefonu yatay tutun ve çevrenizden uzak durun.'**
  String get qiblaInstruction1;

  /// Qibla instruction step 2
  ///
  /// In tr, this message translates to:
  /// **'Kırmızı ibre kıble yönünü gösterir.'**
  String get qiblaInstruction2;

  /// Qibla instruction step 3
  ///
  /// In tr, this message translates to:
  /// **'Metal yüzeylerden ve elektronik cihazlardan uzak durun.'**
  String get qiblaInstruction3;

  /// Profile screen title
  ///
  /// In tr, this message translates to:
  /// **'Profil'**
  String get profileTitle;

  /// Settings section header
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get profileSettings;

  /// Notifications settings label
  ///
  /// In tr, this message translates to:
  /// **'Bildirimler'**
  String get profileNotifications;

  /// Evening reminder time setting
  ///
  /// In tr, this message translates to:
  /// **'Akşam Hatırlatıcısı'**
  String get profileEveningReminderTime;

  /// Update location setting
  ///
  /// In tr, this message translates to:
  /// **'Konumu Güncelle'**
  String get profileUpdateLocation;

  /// Badges section header
  ///
  /// In tr, this message translates to:
  /// **'Rozetlerim'**
  String get profileBadges;

  /// Sign out option
  ///
  /// In tr, this message translates to:
  /// **'Çıkış Yap'**
  String get profileSignOut;

  /// Edit display name option
  ///
  /// In tr, this message translates to:
  /// **'İsmi Düzenle'**
  String get profileEditName;

  /// Prayer time notification body
  ///
  /// In tr, this message translates to:
  /// **'{prayer} vakti geldi.'**
  String notifPrayerTime(String prayer);

  /// Evening reminder notification body
  ///
  /// In tr, this message translates to:
  /// **'Bugün namazlarını kaydetmeyi unuttun mu?'**
  String get notifEveningReminder;

  /// Badge earned notification body
  ///
  /// In tr, this message translates to:
  /// **'Tebrikler! {badgeName} rozetini kazandın!'**
  String notifBadgeEarned(String badgeName);

  /// Onboarding badge category
  ///
  /// In tr, this message translates to:
  /// **'Başlangıç'**
  String get badgeCategoryOnboarding;

  /// Streak badge category
  ///
  /// In tr, this message translates to:
  /// **'Seri'**
  String get badgeCategoryStreak;

  /// Completion badge category
  ///
  /// In tr, this message translates to:
  /// **'Tamamlama'**
  String get badgeCategoryCompletion;

  /// Total count badge category
  ///
  /// In tr, this message translates to:
  /// **'Toplam'**
  String get badgeCategoryTotalCount;

  /// Prayer-specific badge category
  ///
  /// In tr, this message translates to:
  /// **'Namaz'**
  String get badgeCategoryPrayerSpecific;

  /// Honesty badge category
  ///
  /// In tr, this message translates to:
  /// **'Dürüstlük'**
  String get badgeCategoryHonesty;

  /// Special badge category
  ///
  /// In tr, this message translates to:
  /// **'Özel'**
  String get badgeCategorySpecial;

  /// Milestone badge category
  ///
  /// In tr, this message translates to:
  /// **'Kilometre Taşı'**
  String get badgeCategoryMilestone;

  /// No description provided for @badgeIlkAdim.
  ///
  /// In tr, this message translates to:
  /// **'İlk Adım'**
  String get badgeIlkAdim;

  /// No description provided for @badgeHosGeldin.
  ///
  /// In tr, this message translates to:
  /// **'Hoş Geldin'**
  String get badgeHosGeldin;

  /// No description provided for @badge3GunSeri.
  ///
  /// In tr, this message translates to:
  /// **'3 Gün Seri'**
  String get badge3GunSeri;

  /// No description provided for @badge7GunSeri.
  ///
  /// In tr, this message translates to:
  /// **'7 Gün Seri'**
  String get badge7GunSeri;

  /// No description provided for @badge30GunSeri.
  ///
  /// In tr, this message translates to:
  /// **'30 Gün Seri'**
  String get badge30GunSeri;

  /// No description provided for @badgeIstikrarUstasi.
  ///
  /// In tr, this message translates to:
  /// **'İstikrar Ustası'**
  String get badgeIstikrarUstasi;

  /// No description provided for @badgeEfsane.
  ///
  /// In tr, this message translates to:
  /// **'Efsane'**
  String get badgeEfsane;

  /// No description provided for @badgeTamGun.
  ///
  /// In tr, this message translates to:
  /// **'Tam Gün'**
  String get badgeTamGun;

  /// No description provided for @badgeMukemmelHafta.
  ///
  /// In tr, this message translates to:
  /// **'Mükemmel Hafta'**
  String get badgeMukemmelHafta;

  /// No description provided for @badgeMukemmelAy.
  ///
  /// In tr, this message translates to:
  /// **'Mükemmel Ay'**
  String get badgeMukemmelAy;

  /// No description provided for @badge100Namaz.
  ///
  /// In tr, this message translates to:
  /// **'100 Namaz'**
  String get badge100Namaz;

  /// No description provided for @badge500Namaz.
  ///
  /// In tr, this message translates to:
  /// **'500 Namaz'**
  String get badge500Namaz;

  /// No description provided for @badge1000Namaz.
  ///
  /// In tr, this message translates to:
  /// **'1000 Namaz'**
  String get badge1000Namaz;

  /// No description provided for @badge2000Namaz.
  ///
  /// In tr, this message translates to:
  /// **'2000 Namaz'**
  String get badge2000Namaz;

  /// No description provided for @badgeSabahYildizi.
  ///
  /// In tr, this message translates to:
  /// **'Sabah Yıldızı'**
  String get badgeSabahYildizi;

  /// No description provided for @badgeGeceYolcusu.
  ///
  /// In tr, this message translates to:
  /// **'Gece Yolcusu'**
  String get badgeGeceYolcusu;

  /// No description provided for @badgeOgleSavascisi.
  ///
  /// In tr, this message translates to:
  /// **'Öğle Savaşçısı'**
  String get badgeOgleSavascisi;

  /// No description provided for @badgeKazaSavascisi.
  ///
  /// In tr, this message translates to:
  /// **'Kaza Savaşçısı'**
  String get badgeKazaSavascisi;

  /// No description provided for @badgeTelafUstasi.
  ///
  /// In tr, this message translates to:
  /// **'Telafi Ustası'**
  String get badgeTelafUstasi;

  /// No description provided for @badgeRamazanRuhu.
  ///
  /// In tr, this message translates to:
  /// **'Ramazan Ruhu'**
  String get badgeRamazanRuhu;

  /// No description provided for @badgeRamazanTamamladi.
  ///
  /// In tr, this message translates to:
  /// **'Ramazan Tamamladı'**
  String get badgeRamazanTamamladi;

  /// No description provided for @badgeCumaKrali.
  ///
  /// In tr, this message translates to:
  /// **'Cuma Kralı'**
  String get badgeCumaKrali;

  /// No description provided for @badgeBirAy.
  ///
  /// In tr, this message translates to:
  /// **'Bir Ay'**
  String get badgeBirAy;

  /// No description provided for @badgeUcAy.
  ///
  /// In tr, this message translates to:
  /// **'Üç Ay'**
  String get badgeUcAy;

  /// No description provided for @badgeAltiAy.
  ///
  /// In tr, this message translates to:
  /// **'Altı Ay'**
  String get badgeAltiAy;

  /// No description provided for @badgeBirYil.
  ///
  /// In tr, this message translates to:
  /// **'Bir Yıl'**
  String get badgeBirYil;

  /// Badge earned date label
  ///
  /// In tr, this message translates to:
  /// **'{date} tarihinde kazanıldı'**
  String badgeEarnedOn(String date);

  /// Locked badge label
  ///
  /// In tr, this message translates to:
  /// **'Kilitli'**
  String get badgeLocked;

  /// Badge celebration sheet subtitle
  ///
  /// In tr, this message translates to:
  /// **'Yeni bir rozet kazandın!'**
  String get badgeCelebrationSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
