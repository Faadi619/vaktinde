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
  /// **'Vaqt'**
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

  /// Login screen title
  ///
  /// In tr, this message translates to:
  /// **'Hoş geldin'**
  String get loginTitle;

  /// Login screen subtitle
  ///
  /// In tr, this message translates to:
  /// **'Hesabına giriş yap'**
  String get loginSubtitle;

  /// Login social button text
  ///
  /// In tr, this message translates to:
  /// **'Google ile devam et'**
  String get continueWithGoogle;

  /// Login divider text
  ///
  /// In tr, this message translates to:
  /// **'veya e-posta ile'**
  String get orEmailDivider;

  /// Email field label
  ///
  /// In tr, this message translates to:
  /// **'E-posta'**
  String get emailLabel;

  /// Email field placeholder
  ///
  /// In tr, this message translates to:
  /// **'ornek@email.com'**
  String get emailHint;

  /// Password field label
  ///
  /// In tr, this message translates to:
  /// **'Şifre'**
  String get passwordLabel;

  /// Password field placeholder
  ///
  /// In tr, this message translates to:
  /// **'Şifrenizi girin'**
  String get passwordHint;

  /// Forgot password link
  ///
  /// In tr, this message translates to:
  /// **'Şifremi unuttum'**
  String get forgotPassword;

  /// Sign in button
  ///
  /// In tr, this message translates to:
  /// **'Giriş Yap'**
  String get signIn;

  /// Login bottom prompt
  ///
  /// In tr, this message translates to:
  /// **'Hesabın yok mu? Kayıt ol'**
  String get noAccountRegister;

  /// Invalid email login error
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir e-posta adresi girin.'**
  String get errorInvalidEmail;

  /// Invalid credentials login error
  ///
  /// In tr, this message translates to:
  /// **'E-posta veya şifre hatalı.'**
  String get errorInvalidCredentials;

  /// Generic sign in failed error
  ///
  /// In tr, this message translates to:
  /// **'Giriş yapılamadı. Lütfen tekrar deneyin.'**
  String get errorSignInFailed;

  /// Email already in use register error
  ///
  /// In tr, this message translates to:
  /// **'Bu e-posta adresi zaten kullanılıyor.'**
  String get errorEmailAlreadyInUse;

  /// Weak password register error
  ///
  /// In tr, this message translates to:
  /// **'Şifre en az 6 karakter olmalıdır.'**
  String get errorWeakPassword;

  /// Onboarding hero tagline
  ///
  /// In tr, this message translates to:
  /// **'Namazlarını düzenli kıl,\nalışkanlıklarını güçlendir.'**
  String get onboardingAppTagline;

  /// Onboarding feature 1 title
  ///
  /// In tr, this message translates to:
  /// **'Doğru namaz vakitleri'**
  String get onboardingFeature1Title;

  /// Onboarding feature 1 subtitle
  ///
  /// In tr, this message translates to:
  /// **'Diyanet verileriyle, bulunduğun yere göre'**
  String get onboardingFeature1Sub;

  /// Onboarding feature 2 title
  ///
  /// In tr, this message translates to:
  /// **'Seri ve rozetler'**
  String get onboardingFeature2Title;

  /// Onboarding feature 2 subtitle
  ///
  /// In tr, this message translates to:
  /// **'İstikrarını takip et, başarılarını kutla'**
  String get onboardingFeature2Sub;

  /// Onboarding feature 3 title
  ///
  /// In tr, this message translates to:
  /// **'Kıble pusulası'**
  String get onboardingFeature3Title;

  /// Onboarding feature 3 subtitle
  ///
  /// In tr, this message translates to:
  /// **'Her yerde doğru yönü bul'**
  String get onboardingFeature3Sub;

  /// Onboarding create account CTA
  ///
  /// In tr, this message translates to:
  /// **'Hesap Oluştur'**
  String get onboardingCreateAccount;

  /// Onboarding sign in CTA
  ///
  /// In tr, this message translates to:
  /// **'Giriş Yap'**
  String get onboardingSignIn;

  /// Onboarding terms note
  ///
  /// In tr, this message translates to:
  /// **'Devam ederek {terms} ve {privacy}\'nı kabul etmiş olursunuz.'**
  String onboardingTermsNote(String terms, String privacy);

  /// Terms of service label
  ///
  /// In tr, this message translates to:
  /// **'Kullanım Koşulları'**
  String get termsOfService;

  /// Privacy policy label
  ///
  /// In tr, this message translates to:
  /// **'Gizlilik Politikası'**
  String get privacyPolicy;

  /// Register screen title
  ///
  /// In tr, this message translates to:
  /// **'Hesap oluştur'**
  String get registerTitle;

  /// Register screen subtitle
  ///
  /// In tr, this message translates to:
  /// **'Yolculuğuna başla'**
  String get registerSubtitle;

  /// Register Google button
  ///
  /// In tr, this message translates to:
  /// **'Google ile kayıt ol'**
  String get registerWithGoogle;

  /// Full name field label
  ///
  /// In tr, this message translates to:
  /// **'Ad Soyad'**
  String get fullNameLabel;

  /// Full name field placeholder
  ///
  /// In tr, this message translates to:
  /// **'Adınız ve soyadınız'**
  String get fullNameHint;

  /// Create account button
  ///
  /// In tr, this message translates to:
  /// **'Hesap Oluştur'**
  String get createAccount;

  /// Register bottom prompt
  ///
  /// In tr, this message translates to:
  /// **'Zaten hesabın var mı? Giriş yap'**
  String get alreadyHaveAccount;

  /// Terms checkbox suffix text
  ///
  /// In tr, this message translates to:
  /// **'\'nı okudum ve kabul ediyorum.'**
  String get termsCheckboxText;

  /// Weak password strength label
  ///
  /// In tr, this message translates to:
  /// **'Zayıf şifre'**
  String get passwordStrengthWeak;

  /// Medium password strength label
  ///
  /// In tr, this message translates to:
  /// **'Orta şifre'**
  String get passwordStrengthMedium;

  /// Strong password strength label
  ///
  /// In tr, this message translates to:
  /// **'Güçlü şifre'**
  String get passwordStrengthStrong;

  /// Forgot password screen title
  ///
  /// In tr, this message translates to:
  /// **'Şifremi unuttum'**
  String get forgotPasswordTitle;

  /// Forgot password screen subtitle
  ///
  /// In tr, this message translates to:
  /// **'Sıfırlama bağlantısı gönderelim'**
  String get forgotPasswordSubtitle;

  /// Forgot password hint text
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı e-posta adresinizi girin. Şifre sıfırlama bağlantısı göndereceğiz.'**
  String get forgotPasswordHint;

  /// Email address field label (forgot password)
  ///
  /// In tr, this message translates to:
  /// **'E-posta Adresi'**
  String get emailAddressLabel;

  /// Send reset link button
  ///
  /// In tr, this message translates to:
  /// **'Sıfırlama Bağlantısı Gönder'**
  String get sendResetLink;

  /// Forgot password success title
  ///
  /// In tr, this message translates to:
  /// **'E-posta gönderildi!'**
  String get forgotPasswordSuccessTitle;

  /// Forgot password success body
  ///
  /// In tr, this message translates to:
  /// **'Şifre sıfırlama bağlantısı {email} adresine gönderildi. Gelen kutunuzu kontrol edin.'**
  String forgotPasswordSuccessBody(String email);

  /// Back to sign in button
  ///
  /// In tr, this message translates to:
  /// **'Giriş sayfasına dön'**
  String get backToSignIn;

  /// Email not received prefix
  ///
  /// In tr, this message translates to:
  /// **'E-posta gelmedi mi?'**
  String get emailNotReceived;

  /// Resend email link
  ///
  /// In tr, this message translates to:
  /// **'Tekrar gönder'**
  String get resendEmail;

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

  /// Quick mark screen header subtitle
  ///
  /// In tr, this message translates to:
  /// **'Geçmiş günlerde kıldığın veya kaza olarak kıldığın namazları işaretleyebilirsin.'**
  String get quickMarkSubtitle;

  /// Top-right info button label
  ///
  /// In tr, this message translates to:
  /// **'Bilgi'**
  String get quickMarkInfoButton;

  /// Column header — on-time
  ///
  /// In tr, this message translates to:
  /// **'Vaktinde Kıldım'**
  String get quickMarkColumnOnTime;

  /// Column header — kaza
  ///
  /// In tr, this message translates to:
  /// **'Kaza Kıldım'**
  String get quickMarkColumnKaza;

  /// Body of the info banner under the date navigator
  ///
  /// In tr, this message translates to:
  /// **'Bu tarihe ait kılmadığın namazları işaretleyebilir veya kaza olarak kıldığını belirtebilirsin.'**
  String get quickMarkInfoBannerBody;

  /// Note card title
  ///
  /// In tr, this message translates to:
  /// **'Not eklemek ister misin?'**
  String get quickMarkNoteTitle;

  /// Note card subtitle
  ///
  /// In tr, this message translates to:
  /// **'Bu güne dair bir not ekleyebilirsin (isteğe bağlı).'**
  String get quickMarkNoteSubtitle;

  /// Recent history — see all link
  ///
  /// In tr, this message translates to:
  /// **'Tüm Geçmiş'**
  String get quickMarkRecentSeeAll;

  /// Recent entry — prayers marked as kaza
  ///
  /// In tr, this message translates to:
  /// **'{prayers} (Kaza olarak)'**
  String quickMarkRecentKazaSuffix(String prayers);

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

  /// Stats screen header subtitle
  ///
  /// In tr, this message translates to:
  /// **'İbadet yolculuğundaki ilerlemeni görüntüle.'**
  String get statsSubtitle;

  /// This week label
  ///
  /// In tr, this message translates to:
  /// **'Bu Hafta'**
  String get statsThisWeek;

  /// Hero card subtitle under streak count
  ///
  /// In tr, this message translates to:
  /// **'Serin devam ediyor!'**
  String get statsStreakSubtitle;

  /// Day count with unit
  ///
  /// In tr, this message translates to:
  /// **'{count} gün'**
  String statsDaysCount(int count);

  /// Ring chart label
  ///
  /// In tr, this message translates to:
  /// **'Tamamlandı'**
  String get statsRingCompleted;

  /// Weekly chart card title
  ///
  /// In tr, this message translates to:
  /// **'Haftalık Tamamlama Oranı'**
  String get statsWeeklyCompletionRate;

  /// Date range pill: last 7 days
  ///
  /// In tr, this message translates to:
  /// **'Son 7 Gün'**
  String get statsLastSevenDays;

  /// Today label on bar chart
  ///
  /// In tr, this message translates to:
  /// **'Bugün'**
  String get statsToday;

  /// Prayer stats grid card title
  ///
  /// In tr, this message translates to:
  /// **'Namaz İstatistikleri'**
  String get statsPrayerStats;

  /// Totals grid card title
  ///
  /// In tr, this message translates to:
  /// **'Toplam İstatistikler'**
  String get statsTotalStats;

  /// Totals cell: total days prayed
  ///
  /// In tr, this message translates to:
  /// **'Toplam Gün Namaz kıldın'**
  String get statsTotalDaysPrayed;

  /// Totals cell: longest streak days
  ///
  /// In tr, this message translates to:
  /// **'En Uzun Seri Gün'**
  String get statsLongestStreakDays;

  /// Totals cell: average success rate
  ///
  /// In tr, this message translates to:
  /// **'Ortalama Başarı Oranı'**
  String get statsAverageSuccessRate;

  /// Totals cell: total completion count
  ///
  /// In tr, this message translates to:
  /// **'Toplam Tamamlama'**
  String get statsTotalCompletion;

  /// Placeholder for tabs not yet implemented
  ///
  /// In tr, this message translates to:
  /// **'Çok yakında'**
  String get statsComingSoon;

  /// Prayer count out of 7
  ///
  /// In tr, this message translates to:
  /// **'{count}/7'**
  String statsPrayerCountFormat(int count);

  /// Percent value with Turkish-style leading sign
  ///
  /// In tr, this message translates to:
  /// **'%{value}'**
  String statsPercentFormat(int value);

  /// Ring center caption on Haftalık
  ///
  /// In tr, this message translates to:
  /// **'Tamamlama Oranı'**
  String get statsCompletionRatio;

  /// Haftalık bar chart title
  ///
  /// In tr, this message translates to:
  /// **'Günlere Göre Namaz Tamamlama Oranı'**
  String get statsDailyCompletionRate;

  /// Pill label — view details
  ///
  /// In tr, this message translates to:
  /// **'Detay Görüntüle'**
  String get statsDetailView;

  /// Haftalık prayer averages card title
  ///
  /// In tr, this message translates to:
  /// **'Namaz İstatistikleri'**
  String get statsWeeklyAverages;

  /// Inline suffix after "Namaz İstatistikleri"
  ///
  /// In tr, this message translates to:
  /// **'(Haftalık Ortalama)'**
  String get statsWeeklyAveragesSuffix;

  /// Haftalık summary card title
  ///
  /// In tr, this message translates to:
  /// **'Haftalık Özeti'**
  String get statsWeeklySummary;

  /// Summary row label
  ///
  /// In tr, this message translates to:
  /// **'Toplam kıldığın namaz'**
  String get statsSummaryTotalPrayers;

  /// Summary row label
  ///
  /// In tr, this message translates to:
  /// **'Kaza olarak kıldığın namaz'**
  String get statsSummaryMakeupPrayers;

  /// Summary row label
  ///
  /// In tr, this message translates to:
  /// **'En istikrarlı olduğun vakit'**
  String get statsSummaryMostConsistent;

  /// Summary row label
  ///
  /// In tr, this message translates to:
  /// **'En çok zorlandığın vakit'**
  String get statsSummaryHardest;

  /// Placeholder week range
  ///
  /// In tr, this message translates to:
  /// **'12 – 18 Mayıs 2025'**
  String get statsDateRangePlaceholder;

  /// Prayer count out of 7 (decimal supported)
  ///
  /// In tr, this message translates to:
  /// **'{value}/7'**
  String statsPrayerCountDecimalFormat(String value);

  /// This month label
  ///
  /// In tr, this message translates to:
  /// **'Bu Ay'**
  String get statsThisMonth;

  /// Aylık hero subtitle
  ///
  /// In tr, this message translates to:
  /// **'Çok güzel bir istikrar!'**
  String get statsMonthSubtitle;

  /// Aylık ring center caption
  ///
  /// In tr, this message translates to:
  /// **'Tamamlandı'**
  String get statsRingCompletedShort;

  /// Placeholder month label
  ///
  /// In tr, this message translates to:
  /// **'Mayıs 2025'**
  String get statsMonthPlaceholder;

  /// Calendar card title
  ///
  /// In tr, this message translates to:
  /// **'Aylık Namaz Takvimi'**
  String get statsMonthlyCalendarTitle;

  /// Kaza day count pill text
  ///
  /// In tr, this message translates to:
  /// **'{count} kaza gün'**
  String statsKazaDaysFormat(int count);

  /// No description provided for @statsDayStateFull.
  ///
  /// In tr, this message translates to:
  /// **'Tam (5/5)'**
  String get statsDayStateFull;

  /// No description provided for @statsDayStatePartial.
  ///
  /// In tr, this message translates to:
  /// **'Eksik'**
  String get statsDayStatePartial;

  /// No description provided for @statsDayStateMissed.
  ///
  /// In tr, this message translates to:
  /// **'Hiç kılınmadı'**
  String get statsDayStateMissed;

  /// No description provided for @statsDayStateSpecial.
  ///
  /// In tr, this message translates to:
  /// **'Özel gün'**
  String get statsDayStateSpecial;

  /// No description provided for @statsDayStateFuture.
  ///
  /// In tr, this message translates to:
  /// **'Gelecek'**
  String get statsDayStateFuture;

  /// Monthly stats list card title
  ///
  /// In tr, this message translates to:
  /// **'Aylık İstatistikler'**
  String get statsMonthlyStatsTitle;

  /// No description provided for @statsMonthlyTotalPrayers.
  ///
  /// In tr, this message translates to:
  /// **'Toplam kıldığın namaz'**
  String get statsMonthlyTotalPrayers;

  /// No description provided for @statsMonthlyMakeupPrayers.
  ///
  /// In tr, this message translates to:
  /// **'Kaza olarak kıldığın namaz'**
  String get statsMonthlyMakeupPrayers;

  /// No description provided for @statsMonthlyAverageDaily.
  ///
  /// In tr, this message translates to:
  /// **'Ortalama günlük tamamlama'**
  String get statsMonthlyAverageDaily;

  /// No description provided for @statsMonthlyLongestStreak.
  ///
  /// In tr, this message translates to:
  /// **'En uzun seri'**
  String get statsMonthlyLongestStreak;

  /// No description provided for @statsMonthlyConsistentDays.
  ///
  /// In tr, this message translates to:
  /// **'İstikrarlı günler'**
  String get statsMonthlyConsistentDays;

  /// No description provided for @statsMonthlyKazaRequiredDays.
  ///
  /// In tr, this message translates to:
  /// **'Kaza gerektiren günler'**
  String get statsMonthlyKazaRequiredDays;

  /// No description provided for @statsMonthlyMissedDays.
  ///
  /// In tr, this message translates to:
  /// **'Hiç kılınmayan günler'**
  String get statsMonthlyMissedDays;

  /// Day count with unit
  ///
  /// In tr, this message translates to:
  /// **'{count} gün'**
  String statsDaysCountUnit(int count);

  /// Per-prayer monthly bar chart title
  ///
  /// In tr, this message translates to:
  /// **'Namazlara Göre Tamamlama Oranı'**
  String get statsPrayerCompletionTitle;

  /// Insights row card title
  ///
  /// In tr, this message translates to:
  /// **'Bu Ayki İçgörüler'**
  String get statsMonthlyInsightsTitle;

  /// No description provided for @statsInsightLongestStreakCaption.
  ///
  /// In tr, this message translates to:
  /// **'En uzun serin'**
  String get statsInsightLongestStreakCaption;

  /// No description provided for @statsInsightBestPrayerCaption.
  ///
  /// In tr, this message translates to:
  /// **'En istikrarlı vakit'**
  String get statsInsightBestPrayerCaption;

  /// No description provided for @statsInsightMonthOverMonthCaption.
  ///
  /// In tr, this message translates to:
  /// **'Geçen aya göre'**
  String get statsInsightMonthOverMonthCaption;

  /// Aylık note prompt subtitle
  ///
  /// In tr, this message translates to:
  /// **'Bu aya dair bir not ekleyebilirsin.'**
  String get statsMonthlyNoteSubtitle;

  /// No description provided for @statsDayOfWeekMon.
  ///
  /// In tr, this message translates to:
  /// **'Pzt'**
  String get statsDayOfWeekMon;

  /// No description provided for @statsDayOfWeekTue.
  ///
  /// In tr, this message translates to:
  /// **'Sal'**
  String get statsDayOfWeekTue;

  /// No description provided for @statsDayOfWeekWed.
  ///
  /// In tr, this message translates to:
  /// **'Çar'**
  String get statsDayOfWeekWed;

  /// No description provided for @statsDayOfWeekThu.
  ///
  /// In tr, this message translates to:
  /// **'Per'**
  String get statsDayOfWeekThu;

  /// No description provided for @statsDayOfWeekFri.
  ///
  /// In tr, this message translates to:
  /// **'Cum'**
  String get statsDayOfWeekFri;

  /// No description provided for @statsDayOfWeekSat.
  ///
  /// In tr, this message translates to:
  /// **'Cmt'**
  String get statsDayOfWeekSat;

  /// No description provided for @statsDayOfWeekSun.
  ///
  /// In tr, this message translates to:
  /// **'Paz'**
  String get statsDayOfWeekSun;

  /// This year label
  ///
  /// In tr, this message translates to:
  /// **'Bu Yıl'**
  String get statsThisYear;

  /// Yıllık hero subtitle
  ///
  /// In tr, this message translates to:
  /// **'Harika bir yıl geçiriyorsun!'**
  String get statsYearSubtitle;

  /// Placeholder year label
  ///
  /// In tr, this message translates to:
  /// **'2025'**
  String get statsYearPlaceholder;

  /// Yıllık 5-stat row card title
  ///
  /// In tr, this message translates to:
  /// **'Yıllık İstatistikler'**
  String get statsYearlyStatsTitle;

  /// No description provided for @statsYearlyStatTotal.
  ///
  /// In tr, this message translates to:
  /// **'Toplam kıldığın namaz'**
  String get statsYearlyStatTotal;

  /// No description provided for @statsYearlyStatMakeup.
  ///
  /// In tr, this message translates to:
  /// **'Kaza olarak kılınan'**
  String get statsYearlyStatMakeup;

  /// No description provided for @statsYearlyStatAverage.
  ///
  /// In tr, this message translates to:
  /// **'Ort. günlük tamamlama'**
  String get statsYearlyStatAverage;

  /// No description provided for @statsYearlyStatLongestStreak.
  ///
  /// In tr, this message translates to:
  /// **'En uzun seri'**
  String get statsYearlyStatLongestStreak;

  /// No description provided for @statsYearlyStatConsistent.
  ///
  /// In tr, this message translates to:
  /// **'İstikrarlı günler'**
  String get statsYearlyStatConsistent;

  /// 12-month bar chart title
  ///
  /// In tr, this message translates to:
  /// **'Aylara Göre Tamamlama Oranı'**
  String get statsMonthlyCompletionTitle;

  /// Yearly 5-prayer card title
  ///
  /// In tr, this message translates to:
  /// **'Vakitlere Göre Tamamlama Oranı'**
  String get statsPrayerCompletionTitleYearly;

  /// Inline suffix on yearly prayer card
  ///
  /// In tr, this message translates to:
  /// **'(Yıllık Ortalama)'**
  String get statsYearlyAverageSuffix;

  /// Top months mini card title
  ///
  /// In tr, this message translates to:
  /// **'En İstikrarlı Aylar'**
  String get statsMostConsistentMonths;

  /// Yearly achievements mini card title
  ///
  /// In tr, this message translates to:
  /// **'Yıllık Başarılar'**
  String get statsYearlyAchievements;

  /// Footer link
  ///
  /// In tr, this message translates to:
  /// **'Tüm ayları gör'**
  String get statsSeeAllMonths;

  /// Footer link
  ///
  /// In tr, this message translates to:
  /// **'Tüm başarıları gör'**
  String get statsSeeAllAchievements;

  /// No description provided for @statsBadgeStreakMasterTitle.
  ///
  /// In tr, this message translates to:
  /// **'İstikrar Ustası'**
  String get statsBadgeStreakMasterTitle;

  /// No description provided for @statsBadgeStreakMasterSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'30 gün seri'**
  String get statsBadgeStreakMasterSubtitle;

  /// No description provided for @statsBadgeDisciplinedTitle.
  ///
  /// In tr, this message translates to:
  /// **'Disiplinli'**
  String get statsBadgeDisciplinedTitle;

  /// No description provided for @statsBadgeDisciplinedSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'%80+ ortalama'**
  String get statsBadgeDisciplinedSubtitle;

  /// No description provided for @statsBadgeDevotedTitle.
  ///
  /// In tr, this message translates to:
  /// **'Adanmış'**
  String get statsBadgeDevotedTitle;

  /// No description provided for @statsBadgeDevotedSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'300+ gün'**
  String get statsBadgeDevotedSubtitle;

  /// No description provided for @statsMotivationalLine1.
  ///
  /// In tr, this message translates to:
  /// **'Küçük adımlar,'**
  String get statsMotivationalLine1;

  /// No description provided for @statsMotivationalLine2.
  ///
  /// In tr, this message translates to:
  /// **'büyük değişimler yaratır.'**
  String get statsMotivationalLine2;

  /// No description provided for @statsMotivationalBody.
  ///
  /// In tr, this message translates to:
  /// **'İstikrarın ve çaban senin en büyük kazancın.'**
  String get statsMotivationalBody;

  /// Yıllık note prompt subtitle
  ///
  /// In tr, this message translates to:
  /// **'Bu yıla dair bir not ekleyebilirsin (isteğe bağlı).'**
  String get statsYearlyNoteSubtitle;

  /// No description provided for @statsMonthShortJan.
  ///
  /// In tr, this message translates to:
  /// **'Oca'**
  String get statsMonthShortJan;

  /// No description provided for @statsMonthShortFeb.
  ///
  /// In tr, this message translates to:
  /// **'Şub'**
  String get statsMonthShortFeb;

  /// No description provided for @statsMonthShortMar.
  ///
  /// In tr, this message translates to:
  /// **'Mar'**
  String get statsMonthShortMar;

  /// No description provided for @statsMonthShortApr.
  ///
  /// In tr, this message translates to:
  /// **'Nis'**
  String get statsMonthShortApr;

  /// No description provided for @statsMonthShortMay.
  ///
  /// In tr, this message translates to:
  /// **'May'**
  String get statsMonthShortMay;

  /// No description provided for @statsMonthShortJun.
  ///
  /// In tr, this message translates to:
  /// **'Haz'**
  String get statsMonthShortJun;

  /// No description provided for @statsMonthShortJul.
  ///
  /// In tr, this message translates to:
  /// **'Tem'**
  String get statsMonthShortJul;

  /// No description provided for @statsMonthShortAug.
  ///
  /// In tr, this message translates to:
  /// **'Ağu'**
  String get statsMonthShortAug;

  /// No description provided for @statsMonthShortSep.
  ///
  /// In tr, this message translates to:
  /// **'Eyl'**
  String get statsMonthShortSep;

  /// No description provided for @statsMonthShortOct.
  ///
  /// In tr, this message translates to:
  /// **'Eki'**
  String get statsMonthShortOct;

  /// No description provided for @statsMonthShortNov.
  ///
  /// In tr, this message translates to:
  /// **'Kas'**
  String get statsMonthShortNov;

  /// No description provided for @statsMonthShortDec.
  ///
  /// In tr, this message translates to:
  /// **'Ara'**
  String get statsMonthShortDec;

  /// No description provided for @statsMonthFullJan.
  ///
  /// In tr, this message translates to:
  /// **'Ocak'**
  String get statsMonthFullJan;

  /// No description provided for @statsMonthFullFeb.
  ///
  /// In tr, this message translates to:
  /// **'Şubat'**
  String get statsMonthFullFeb;

  /// No description provided for @statsMonthFullMar.
  ///
  /// In tr, this message translates to:
  /// **'Mart'**
  String get statsMonthFullMar;

  /// No description provided for @statsMonthFullApr.
  ///
  /// In tr, this message translates to:
  /// **'Nisan'**
  String get statsMonthFullApr;

  /// No description provided for @statsMonthFullMay.
  ///
  /// In tr, this message translates to:
  /// **'Mayıs'**
  String get statsMonthFullMay;

  /// No description provided for @statsMonthFullJun.
  ///
  /// In tr, this message translates to:
  /// **'Haziran'**
  String get statsMonthFullJun;

  /// No description provided for @statsMonthFullJul.
  ///
  /// In tr, this message translates to:
  /// **'Temmuz'**
  String get statsMonthFullJul;

  /// No description provided for @statsMonthFullAug.
  ///
  /// In tr, this message translates to:
  /// **'Ağustos'**
  String get statsMonthFullAug;

  /// No description provided for @statsMonthFullSep.
  ///
  /// In tr, this message translates to:
  /// **'Eylül'**
  String get statsMonthFullSep;

  /// No description provided for @statsMonthFullOct.
  ///
  /// In tr, this message translates to:
  /// **'Ekim'**
  String get statsMonthFullOct;

  /// No description provided for @statsMonthFullNov.
  ///
  /// In tr, this message translates to:
  /// **'Kasım'**
  String get statsMonthFullNov;

  /// No description provided for @statsMonthFullDec.
  ///
  /// In tr, this message translates to:
  /// **'Aralık'**
  String get statsMonthFullDec;

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

  /// Best month label
  ///
  /// In tr, this message translates to:
  /// **'En İyi Ay'**
  String get statsBestMonth;

  /// Qibla screen title
  ///
  /// In tr, this message translates to:
  /// **'Kıble Bul'**
  String get qiblaTitle;

  /// Qibla screen subtitle
  ///
  /// In tr, this message translates to:
  /// **'Kıble yönünü bulun ve yönünüzü kontrol edin.'**
  String get qiblaSubtitle;

  /// Qibla map button
  ///
  /// In tr, this message translates to:
  /// **'Harita'**
  String get qiblaMapButton;

  /// Qibla location mode label
  ///
  /// In tr, this message translates to:
  /// **'Otomatik konum'**
  String get qiblaLocationAuto;

  /// Qibla direction value label
  ///
  /// In tr, this message translates to:
  /// **'Kıble Yönü'**
  String get qiblaDirectionLabel;

  /// Qibla location accuracy label
  ///
  /// In tr, this message translates to:
  /// **'Konum Doğruluğu'**
  String get qiblaAccuracyLabel;

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
  /// **'Nasıl kullanılır?'**
  String get qiblaInstructionsTitle;

  /// Qibla instruction step 1
  ///
  /// In tr, this message translates to:
  /// **'Telefonu düz bir zemine parallel tutun ve okun yeşil işaretle aynı hizaya gelmesini sağlayın.'**
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

  /// Profile screen header subtitle
  ///
  /// In tr, this message translates to:
  /// **'Hesap bilgilerinizi görüntüleyin ve ayarlarınızı yönetin.'**
  String get profileSubtitle;

  /// Religion tag on profile card
  ///
  /// In tr, this message translates to:
  /// **'Müslüman'**
  String get profileTagMuslim;

  /// Country tag on profile card
  ///
  /// In tr, this message translates to:
  /// **'Türkiye'**
  String get profileTagCountry;

  /// No description provided for @profileStatConsistentDays.
  ///
  /// In tr, this message translates to:
  /// **'İstikrarlı gün'**
  String get profileStatConsistentDays;

  /// No description provided for @profileStatLongestStreak.
  ///
  /// In tr, this message translates to:
  /// **'En uzun seri'**
  String get profileStatLongestStreak;

  /// No description provided for @profileStatTotalPrayers.
  ///
  /// In tr, this message translates to:
  /// **'Toplam namaz'**
  String get profileStatTotalPrayers;

  /// No description provided for @profileStatAverageRate.
  ///
  /// In tr, this message translates to:
  /// **'Ortalama oran'**
  String get profileStatAverageRate;

  /// No description provided for @profileSectionAccount.
  ///
  /// In tr, this message translates to:
  /// **'Hesap'**
  String get profileSectionAccount;

  /// No description provided for @profileSectionWorship.
  ///
  /// In tr, this message translates to:
  /// **'İbadet Ayarları'**
  String get profileSectionWorship;

  /// No description provided for @profileSectionOther.
  ///
  /// In tr, this message translates to:
  /// **'Diğer'**
  String get profileSectionOther;

  /// No description provided for @profileMenuPersonalTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kişisel Bilgilerim'**
  String get profileMenuPersonalTitle;

  /// No description provided for @profileMenuPersonalSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Ad, e-posta ve konum'**
  String get profileMenuPersonalSubtitle;

  /// No description provided for @profileMenuPasswordTitle.
  ///
  /// In tr, this message translates to:
  /// **'Şifre Değiştir'**
  String get profileMenuPasswordTitle;

  /// No description provided for @profileMenuPasswordSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Hesap şifrenizi değiştirin'**
  String get profileMenuPasswordSubtitle;

  /// No description provided for @profileMenuNotificationsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Bildirim Ayarları'**
  String get profileMenuNotificationsTitle;

  /// No description provided for @profileMenuNotificationsSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Hatırlatmalar ve bildirim tercihleri'**
  String get profileMenuNotificationsSubtitle;

  /// No description provided for @profileMenuAppSettingsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Uygulama Ayarları'**
  String get profileMenuAppSettingsTitle;

  /// No description provided for @profileMenuAppSettingsSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Tema, dil ve diğer tercihler'**
  String get profileMenuAppSettingsSubtitle;

  /// No description provided for @profileMenuPrayerTimesTitle.
  ///
  /// In tr, this message translates to:
  /// **'Namaz Vakitleri'**
  String get profileMenuPrayerTimesTitle;

  /// No description provided for @profileMenuPrayerTimesSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Hesaplama yöntemi ve ayarlar'**
  String get profileMenuPrayerTimesSubtitle;

  /// No description provided for @profileMenuQiblaTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kıble Ayarları'**
  String get profileMenuQiblaTitle;

  /// No description provided for @profileMenuQiblaSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Kıble hesaplama ve pusula ayarları'**
  String get profileMenuQiblaSubtitle;

  /// No description provided for @profileMenuQuickMarkTitle.
  ///
  /// In tr, this message translates to:
  /// **'Hızlı İşaretleme'**
  String get profileMenuQuickMarkTitle;

  /// No description provided for @profileMenuQuickMarkSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Geriye dönük işaretleme ayarları'**
  String get profileMenuQuickMarkSubtitle;

  /// No description provided for @profileMenuKazaReminderTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kaza Namazı Hatırlatıcıları'**
  String get profileMenuKazaReminderTitle;

  /// No description provided for @profileMenuKazaReminderSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Kaza namazı hatırlatma tercihleri'**
  String get profileMenuKazaReminderSubtitle;

  /// No description provided for @profileMenuBackupTitle.
  ///
  /// In tr, this message translates to:
  /// **'Veri Yedekleme'**
  String get profileMenuBackupTitle;

  /// No description provided for @profileMenuBackupSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Verilerinizi yedekleyin veya geri yükleyin'**
  String get profileMenuBackupSubtitle;

  /// No description provided for @profileMenuAboutTitle.
  ///
  /// In tr, this message translates to:
  /// **'Hakkımızda'**
  String get profileMenuAboutTitle;

  /// No description provided for @profileMenuAboutSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Uygulama hakkında bilgi'**
  String get profileMenuAboutSubtitle;

  /// No description provided for @profileMenuHelpTitle.
  ///
  /// In tr, this message translates to:
  /// **'Yardım ve Destek'**
  String get profileMenuHelpTitle;

  /// No description provided for @profileMenuHelpSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Sıkça sorulan sorular'**
  String get profileMenuHelpSubtitle;

  /// No description provided for @profileMenuPrivacyTitle.
  ///
  /// In tr, this message translates to:
  /// **'Gizlilik Politikası'**
  String get profileMenuPrivacyTitle;

  /// No description provided for @profileMenuPrivacySubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Gizlilik ve veri kullanım politikamız'**
  String get profileMenuPrivacySubtitle;

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

  /// City picker screen title
  ///
  /// In tr, this message translates to:
  /// **'Şehir Seç'**
  String get cityPickerTitle;

  /// City picker screen subtitle
  ///
  /// In tr, this message translates to:
  /// **'Konumunu manuel olarak belirle'**
  String get cityPickerSubtitle;

  /// City search input placeholder
  ///
  /// In tr, this message translates to:
  /// **'Şehir ara (örn. İstanbul)'**
  String get cityPickerHint;

  /// Empty search result message
  ///
  /// In tr, this message translates to:
  /// **'Bu arama için sonuç bulunamadı.'**
  String get cityPickerNoResults;

  /// Search failure message
  ///
  /// In tr, this message translates to:
  /// **'Arama yapılamadı. İnternet bağlantınızı kontrol edin.'**
  String get cityPickerSearchFailed;

  /// Qibla empty state heading when no location is available
  ///
  /// In tr, this message translates to:
  /// **'Konum gerekli'**
  String get qiblaLocationNeededTitle;

  /// Qibla empty state body text
  ///
  /// In tr, this message translates to:
  /// **'Kıbleyi gösterebilmemiz için konumuna ihtiyacımız var. Konum izni vermek istemiyorsan şehrini manuel olarak seçebilirsin.'**
  String get qiblaLocationNeededBody;

  /// CTA on qibla empty state — opens city picker
  ///
  /// In tr, this message translates to:
  /// **'Şehir Seç'**
  String get qiblaSelectCity;

  /// Secondary CTA on qibla empty state — retries permission
  ///
  /// In tr, this message translates to:
  /// **'GPS Kullan'**
  String get qiblaUseGps;
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
