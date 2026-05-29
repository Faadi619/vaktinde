// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Vaqt';

  @override
  String get loading => 'Yükleniyor...';

  @override
  String get save => 'Kaydet';

  @override
  String get cancel => 'İptal';

  @override
  String get close => 'Kapat';

  @override
  String get confirm => 'Onayla';

  @override
  String get retry => 'Tekrar Dene';

  @override
  String get errorGeneric => 'Bir hata oluştu. Lütfen tekrar deneyin.';

  @override
  String get errorNoInternet =>
      'İnternet bağlantısı yok. Kaydedilen veriler gösteriliyor.';

  @override
  String get errorLocationDenied =>
      'Konum izni reddedildi. Lütfen ayarlardan izin verin.';

  @override
  String get signInWithGoogle => 'Google ile Giriş Yap';

  @override
  String get loginTitle => 'Hoş geldin';

  @override
  String get loginSubtitle => 'Hesabına giriş yap';

  @override
  String get continueWithGoogle => 'Google ile devam et';

  @override
  String get orEmailDivider => 'veya e-posta ile';

  @override
  String get emailLabel => 'E-posta';

  @override
  String get emailHint => 'ornek@email.com';

  @override
  String get passwordLabel => 'Şifre';

  @override
  String get passwordHint => 'Şifrenizi girin';

  @override
  String get forgotPassword => 'Şifremi unuttum';

  @override
  String get signIn => 'Giriş Yap';

  @override
  String get noAccountRegister => 'Hesabın yok mu? Kayıt ol';

  @override
  String get errorInvalidEmail => 'Geçerli bir e-posta adresi girin.';

  @override
  String get errorInvalidCredentials => 'E-posta veya şifre hatalı.';

  @override
  String get errorSignInFailed => 'Giriş yapılamadı. Lütfen tekrar deneyin.';

  @override
  String get errorEmailAlreadyInUse => 'Bu e-posta adresi zaten kullanılıyor.';

  @override
  String get errorWeakPassword => 'Şifre en az 6 karakter olmalıdır.';

  @override
  String get onboardingAppTagline =>
      'Namazlarını düzenli kıl,\nalışkanlıklarını güçlendir.';

  @override
  String get onboardingFeature1Title => 'Doğru namaz vakitleri';

  @override
  String get onboardingFeature1Sub =>
      'Diyanet verileriyle, bulunduğun yere göre';

  @override
  String get onboardingFeature2Title => 'Seri ve rozetler';

  @override
  String get onboardingFeature2Sub =>
      'İstikrarını takip et, başarılarını kutla';

  @override
  String get onboardingFeature3Title => 'Kıble pusulası';

  @override
  String get onboardingFeature3Sub => 'Her yerde doğru yönü bul';

  @override
  String get onboardingCreateAccount => 'Hesap Oluştur';

  @override
  String get onboardingSignIn => 'Giriş Yap';

  @override
  String onboardingTermsNote(String terms, String privacy) {
    return 'Devam ederek $terms ve $privacy\'nı kabul etmiş olursunuz.';
  }

  @override
  String get termsOfService => 'Kullanım Koşulları';

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String get registerTitle => 'Hesap oluştur';

  @override
  String get registerSubtitle => 'Yolculuğuna başla';

  @override
  String get registerWithGoogle => 'Google ile kayıt ol';

  @override
  String get fullNameLabel => 'Ad Soyad';

  @override
  String get fullNameHint => 'Adınız ve soyadınız';

  @override
  String get createAccount => 'Hesap Oluştur';

  @override
  String get alreadyHaveAccount => 'Zaten hesabın var mı? Giriş yap';

  @override
  String get termsCheckboxText => '\'nı okudum ve kabul ediyorum.';

  @override
  String get passwordStrengthWeak => 'Zayıf şifre';

  @override
  String get passwordStrengthMedium => 'Orta şifre';

  @override
  String get passwordStrengthStrong => 'Güçlü şifre';

  @override
  String get forgotPasswordTitle => 'Şifremi unuttum';

  @override
  String get forgotPasswordSubtitle => 'Sıfırlama bağlantısı gönderelim';

  @override
  String get forgotPasswordHint =>
      'Kayıtlı e-posta adresinizi girin. Şifre sıfırlama bağlantısı göndereceğiz.';

  @override
  String get emailAddressLabel => 'E-posta Adresi';

  @override
  String get sendResetLink => 'Sıfırlama Bağlantısı Gönder';

  @override
  String get forgotPasswordSuccessTitle => 'E-posta gönderildi!';

  @override
  String forgotPasswordSuccessBody(String email) {
    return 'Şifre sıfırlama bağlantısı $email adresine gönderildi. Gelen kutunuzu kontrol edin.';
  }

  @override
  String get backToSignIn => 'Giriş sayfasına dön';

  @override
  String get emailNotReceived => 'E-posta gelmedi mi?';

  @override
  String get resendEmail => 'Tekrar gönder';

  @override
  String get signOut => 'Çıkış Yap';

  @override
  String get welcomeTitle => 'Hoş Geldin';

  @override
  String get welcomeSubtitle => 'Namaz alışkanlığını takip et, gücünü hisset.';

  @override
  String get locationPermissionTitle => 'Konum İzni';

  @override
  String get locationPermissionMessage =>
      'Namaz vakitlerini ve kıble yönünü doğru hesaplayabilmek için konumunuza ihtiyacımız var.';

  @override
  String get allowLocation => 'Konuma İzin Ver';

  @override
  String get selectCityManually => 'Şehri Manuel Seç';

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navStats => 'İstatistikler';

  @override
  String get navQuickMark => 'Hızlı İşaretle';

  @override
  String get navQibla => 'Kıble';

  @override
  String get navProfile => 'Profil';

  @override
  String get prayerFajr => 'Sabah';

  @override
  String get prayerDhuhr => 'Öğle';

  @override
  String get prayerAsr => 'İkindi';

  @override
  String get prayerMaghrib => 'Akşam';

  @override
  String get prayerIsha => 'Yatsı';

  @override
  String get prayerImsak => 'İmsak';

  @override
  String get prayerSunrise => 'Güneş';

  @override
  String get prayerOnTime => 'Vaktinde';

  @override
  String get prayerKaza => 'Kaza';

  @override
  String get markAsOnTime => 'Vaktinde Kıldım';

  @override
  String get markAsKaza => 'Kaza Olarak Kıldım';

  @override
  String get todayPrayers => 'Bugünün Namazları';

  @override
  String get nextPrayer => 'Sonraki Namaz';

  @override
  String remainingTime(String time) {
    return '$time kaldı';
  }

  @override
  String get specialDayMode => 'Özel Gün Modu';

  @override
  String get specialDayTravel => 'Seyahat';

  @override
  String get specialDayIllness => 'Hastalık';

  @override
  String get specialDayOther => 'Diğer';

  @override
  String specialDayActive(String type) {
    return 'Özel gün aktif: $type';
  }

  @override
  String streakDays(int count) {
    return '$count Gün Seri';
  }

  @override
  String get streakFrozenMessage => 'Dünkü seriniz bir mühlet günüyle korundu.';

  @override
  String get streakBrokenMessage =>
      'Her gün yeni bir başlangıç. Geçmişin kayıtlarda, bugünden itibaren devam et.';

  @override
  String get streakReengagementMessage =>
      '3 günlük yeni seri! Devam ediyorsun.';

  @override
  String streakFreezesRemaining(int count) {
    return '$count mühlet gününüz kaldı';
  }

  @override
  String get bestStreak => 'En İyi Seri';

  @override
  String get totalEngagementDays => 'Toplam Aktif Gün';

  @override
  String get quickMarkTitle => 'Hızlı İşaretle';

  @override
  String get quickMarkSaveButton => 'Seçimleri Kaydet';

  @override
  String get quickMarkNote => 'Gün notu (isteğe bağlı)';

  @override
  String get quickMarkRecentHistory => 'Son İşaretlemeler';

  @override
  String get quickMarkSavedSuccess => 'Kaydedildi.';

  @override
  String get quickMarkSubtitle =>
      'Geçmiş günlerde kıldığın veya kaza olarak kıldığın namazları işaretleyebilirsin.';

  @override
  String get quickMarkInfoButton => 'Bilgi';

  @override
  String get quickMarkColumnOnTime => 'Vaktinde Kıldım';

  @override
  String get quickMarkColumnKaza => 'Kaza Kıldım';

  @override
  String get quickMarkInfoBannerBody =>
      'Bu tarihe ait kılmadığın namazları işaretleyebilir veya kaza olarak kıldığını belirtebilirsin.';

  @override
  String get quickMarkNoteTitle => 'Not eklemek ister misin?';

  @override
  String get quickMarkNoteSubtitle =>
      'Bu güne dair bir not ekleyebilirsin (isteğe bağlı).';

  @override
  String get quickMarkRecentSeeAll => 'Tüm Geçmiş';

  @override
  String quickMarkRecentKazaSuffix(String prayers) {
    return '$prayers (Kaza olarak)';
  }

  @override
  String get statsTitle => 'İstatistikler';

  @override
  String get statsTabOverview => 'Genel Bakış';

  @override
  String get statsTabWeekly => 'Haftalık';

  @override
  String get statsTabMonthly => 'Aylık';

  @override
  String get statsTabYearly => 'Yıllık';

  @override
  String get statsSubtitle => 'İbadet yolculuğundaki ilerlemeni görüntüle.';

  @override
  String get statsThisWeek => 'Bu Hafta';

  @override
  String get statsStreakSubtitle => 'Serin devam ediyor!';

  @override
  String statsDaysCount(int count) {
    return '$count gün';
  }

  @override
  String get statsRingCompleted => 'Tamamlandı';

  @override
  String get statsWeeklyCompletionRate => 'Haftalık Tamamlama Oranı';

  @override
  String get statsLastSevenDays => 'Son 7 Gün';

  @override
  String get statsToday => 'Bugün';

  @override
  String get statsPrayerStats => 'Namaz İstatistikleri';

  @override
  String get statsTotalStats => 'Toplam İstatistikler';

  @override
  String get statsTotalDaysPrayed => 'Toplam Gün Namaz kıldın';

  @override
  String get statsLongestStreakDays => 'En Uzun Seri Gün';

  @override
  String get statsAverageSuccessRate => 'Ortalama Başarı Oranı';

  @override
  String get statsTotalCompletion => 'Toplam Tamamlama';

  @override
  String get statsComingSoon => 'Çok yakında';

  @override
  String statsPrayerCountFormat(int count) {
    return '$count/7';
  }

  @override
  String statsPercentFormat(int value) {
    return '%$value';
  }

  @override
  String get statsCompletionRatio => 'Tamamlama Oranı';

  @override
  String get statsDailyCompletionRate => 'Günlere Göre Namaz Tamamlama Oranı';

  @override
  String get statsDetailView => 'Detay Görüntüle';

  @override
  String get statsWeeklyAverages => 'Namaz İstatistikleri';

  @override
  String get statsWeeklyAveragesSuffix => '(Haftalık Ortalama)';

  @override
  String get statsWeeklySummary => 'Haftalık Özeti';

  @override
  String get statsSummaryTotalPrayers => 'Toplam kıldığın namaz';

  @override
  String get statsSummaryMakeupPrayers => 'Kaza olarak kıldığın namaz';

  @override
  String get statsSummaryMostConsistent => 'En istikrarlı olduğun vakit';

  @override
  String get statsSummaryHardest => 'En çok zorlandığın vakit';

  @override
  String get statsDateRangePlaceholder => '12 – 18 Mayıs 2025';

  @override
  String statsPrayerCountDecimalFormat(String value) {
    return '$value/7';
  }

  @override
  String get statsThisMonth => 'Bu Ay';

  @override
  String get statsMonthSubtitle => 'Çok güzel bir istikrar!';

  @override
  String get statsRingCompletedShort => 'Tamamlandı';

  @override
  String get statsMonthPlaceholder => 'Mayıs 2025';

  @override
  String get statsMonthlyCalendarTitle => 'Aylık Namaz Takvimi';

  @override
  String statsKazaDaysFormat(int count) {
    return '$count kaza gün';
  }

  @override
  String get statsDayStateFull => 'Tam (5/5)';

  @override
  String get statsDayStatePartial => 'Eksik';

  @override
  String get statsDayStateMissed => 'Hiç kılınmadı';

  @override
  String get statsDayStateSpecial => 'Özel gün';

  @override
  String get statsDayStateFuture => 'Gelecek';

  @override
  String get statsMonthlyStatsTitle => 'Aylık İstatistikler';

  @override
  String get statsMonthlyTotalPrayers => 'Toplam kıldığın namaz';

  @override
  String get statsMonthlyMakeupPrayers => 'Kaza olarak kıldığın namaz';

  @override
  String get statsMonthlyAverageDaily => 'Ortalama günlük tamamlama';

  @override
  String get statsMonthlyLongestStreak => 'En uzun seri';

  @override
  String get statsMonthlyConsistentDays => 'İstikrarlı günler';

  @override
  String get statsMonthlyKazaRequiredDays => 'Kaza gerektiren günler';

  @override
  String get statsMonthlyMissedDays => 'Hiç kılınmayan günler';

  @override
  String statsDaysCountUnit(int count) {
    return '$count gün';
  }

  @override
  String get statsPrayerCompletionTitle => 'Namazlara Göre Tamamlama Oranı';

  @override
  String get statsMonthlyInsightsTitle => 'Bu Ayki İçgörüler';

  @override
  String get statsInsightLongestStreakCaption => 'En uzun serin';

  @override
  String get statsInsightBestPrayerCaption => 'En istikrarlı vakit';

  @override
  String get statsInsightMonthOverMonthCaption => 'Geçen aya göre';

  @override
  String get statsMonthlyNoteSubtitle => 'Bu aya dair bir not ekleyebilirsin.';

  @override
  String get statsDayOfWeekMon => 'Pzt';

  @override
  String get statsDayOfWeekTue => 'Sal';

  @override
  String get statsDayOfWeekWed => 'Çar';

  @override
  String get statsDayOfWeekThu => 'Per';

  @override
  String get statsDayOfWeekFri => 'Cum';

  @override
  String get statsDayOfWeekSat => 'Cmt';

  @override
  String get statsDayOfWeekSun => 'Paz';

  @override
  String get statsThisYear => 'Bu Yıl';

  @override
  String get statsYearSubtitle => 'Harika bir yıl geçiriyorsun!';

  @override
  String get statsYearPlaceholder => '2025';

  @override
  String get statsYearlyStatsTitle => 'Yıllık İstatistikler';

  @override
  String get statsYearlyStatTotal => 'Toplam kıldığın namaz';

  @override
  String get statsYearlyStatMakeup => 'Kaza olarak kılınan';

  @override
  String get statsYearlyStatAverage => 'Ort. günlük tamamlama';

  @override
  String get statsYearlyStatLongestStreak => 'En uzun seri';

  @override
  String get statsYearlyStatConsistent => 'İstikrarlı günler';

  @override
  String get statsMonthlyCompletionTitle => 'Aylara Göre Tamamlama Oranı';

  @override
  String get statsPrayerCompletionTitleYearly =>
      'Vakitlere Göre Tamamlama Oranı';

  @override
  String get statsYearlyAverageSuffix => '(Yıllık Ortalama)';

  @override
  String get statsMostConsistentMonths => 'En İstikrarlı Aylar';

  @override
  String get statsYearlyAchievements => 'Yıllık Başarılar';

  @override
  String get statsSeeAllMonths => 'Tüm ayları gör';

  @override
  String get statsSeeAllAchievements => 'Tüm başarıları gör';

  @override
  String get statsBadgeStreakMasterTitle => 'İstikrar Ustası';

  @override
  String get statsBadgeStreakMasterSubtitle => '30 gün seri';

  @override
  String get statsBadgeDisciplinedTitle => 'Disiplinli';

  @override
  String get statsBadgeDisciplinedSubtitle => '%80+ ortalama';

  @override
  String get statsBadgeDevotedTitle => 'Adanmış';

  @override
  String get statsBadgeDevotedSubtitle => '300+ gün';

  @override
  String get statsMotivationalLine1 => 'Küçük adımlar,';

  @override
  String get statsMotivationalLine2 => 'büyük değişimler yaratır.';

  @override
  String get statsMotivationalBody =>
      'İstikrarın ve çaban senin en büyük kazancın.';

  @override
  String get statsYearlyNoteSubtitle =>
      'Bu yıla dair bir not ekleyebilirsin (isteğe bağlı).';

  @override
  String get statsMonthShortJan => 'Oca';

  @override
  String get statsMonthShortFeb => 'Şub';

  @override
  String get statsMonthShortMar => 'Mar';

  @override
  String get statsMonthShortApr => 'Nis';

  @override
  String get statsMonthShortMay => 'May';

  @override
  String get statsMonthShortJun => 'Haz';

  @override
  String get statsMonthShortJul => 'Tem';

  @override
  String get statsMonthShortAug => 'Ağu';

  @override
  String get statsMonthShortSep => 'Eyl';

  @override
  String get statsMonthShortOct => 'Eki';

  @override
  String get statsMonthShortNov => 'Kas';

  @override
  String get statsMonthShortDec => 'Ara';

  @override
  String get statsMonthFullJan => 'Ocak';

  @override
  String get statsMonthFullFeb => 'Şubat';

  @override
  String get statsMonthFullMar => 'Mart';

  @override
  String get statsMonthFullApr => 'Nisan';

  @override
  String get statsMonthFullMay => 'Mayıs';

  @override
  String get statsMonthFullJun => 'Haziran';

  @override
  String get statsMonthFullJul => 'Temmuz';

  @override
  String get statsMonthFullAug => 'Ağustos';

  @override
  String get statsMonthFullSep => 'Eylül';

  @override
  String get statsMonthFullOct => 'Ekim';

  @override
  String get statsMonthFullNov => 'Kasım';

  @override
  String get statsMonthFullDec => 'Aralık';

  @override
  String get statsTotalPrayers => 'Toplam Namaz';

  @override
  String get statsTotalDays => 'Toplam Gün';

  @override
  String get statsCompletionRate => 'Tamamlanma Oranı';

  @override
  String get statsBestMonth => 'En İyi Ay';

  @override
  String get qiblaTitle => 'Kıble Bul';

  @override
  String get qiblaSubtitle => 'Kıble yönünü bulun ve yönünüzü kontrol edin.';

  @override
  String get qiblaMapButton => 'Harita';

  @override
  String get qiblaLocationAuto => 'Otomatik konum';

  @override
  String get qiblaDirectionLabel => 'Kıble Yönü';

  @override
  String get qiblaAccuracyLabel => 'Konum Doğruluğu';

  @override
  String qiblaDegrees(String degrees) {
    return '$degrees°';
  }

  @override
  String get qiblaAccuracyHigh => 'Yüksek';

  @override
  String get qiblaAccuracyMedium => 'Orta';

  @override
  String get qiblaAccuracyLow => 'Düşük';

  @override
  String get qiblaInstructionsTitle => 'Nasıl kullanılır?';

  @override
  String get qiblaInstruction1 =>
      'Telefonu düz bir zemine parallel tutun ve okun yeşil işaretle aynı hizaya gelmesini sağlayın.';

  @override
  String get qiblaInstruction2 => 'Kırmızı ibre kıble yönünü gösterir.';

  @override
  String get qiblaInstruction3 =>
      'Metal yüzeylerden ve elektronik cihazlardan uzak durun.';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileSettings => 'Ayarlar';

  @override
  String get profileNotifications => 'Bildirimler';

  @override
  String get profileEveningReminderTime => 'Akşam Hatırlatıcısı';

  @override
  String get profileUpdateLocation => 'Konumu Güncelle';

  @override
  String get profileBadges => 'Rozetlerim';

  @override
  String get profileSignOut => 'Çıkış Yap';

  @override
  String get profileEditName => 'İsmi Düzenle';

  @override
  String get profileSubtitle =>
      'Hesap bilgilerinizi görüntüleyin ve ayarlarınızı yönetin.';

  @override
  String get profileTagMuslim => 'Müslüman';

  @override
  String get profileTagCountry => 'Türkiye';

  @override
  String get profileStatConsistentDays => 'İstikrarlı gün';

  @override
  String get profileStatLongestStreak => 'En uzun seri';

  @override
  String get profileStatTotalPrayers => 'Toplam namaz';

  @override
  String get profileStatAverageRate => 'Ortalama oran';

  @override
  String get profileSectionAccount => 'Hesap';

  @override
  String get profileSectionWorship => 'İbadet Ayarları';

  @override
  String get profileSectionOther => 'Diğer';

  @override
  String get profileMenuPersonalTitle => 'Kişisel Bilgilerim';

  @override
  String get profileMenuPersonalSubtitle => 'Ad, e-posta ve konum';

  @override
  String get profileMenuPasswordTitle => 'Şifre Değiştir';

  @override
  String get profileMenuPasswordSubtitle => 'Hesap şifrenizi değiştirin';

  @override
  String get profileMenuNotificationsTitle => 'Bildirim Ayarları';

  @override
  String get profileMenuNotificationsSubtitle =>
      'Hatırlatmalar ve bildirim tercihleri';

  @override
  String get profileMenuAppSettingsTitle => 'Uygulama Ayarları';

  @override
  String get profileMenuAppSettingsSubtitle => 'Tema, dil ve diğer tercihler';

  @override
  String get profileMenuPrayerTimesTitle => 'Namaz Vakitleri';

  @override
  String get profileMenuPrayerTimesSubtitle => 'Hesaplama yöntemi ve ayarlar';

  @override
  String get profileMenuQiblaTitle => 'Kıble Ayarları';

  @override
  String get profileMenuQiblaSubtitle => 'Kıble hesaplama ve pusula ayarları';

  @override
  String get profileMenuQuickMarkTitle => 'Hızlı İşaretleme';

  @override
  String get profileMenuQuickMarkSubtitle => 'Geriye dönük işaretleme ayarları';

  @override
  String get profileMenuKazaReminderTitle => 'Kaza Namazı Hatırlatıcıları';

  @override
  String get profileMenuKazaReminderSubtitle =>
      'Kaza namazı hatırlatma tercihleri';

  @override
  String get profileMenuBackupTitle => 'Veri Yedekleme';

  @override
  String get profileMenuBackupSubtitle =>
      'Verilerinizi yedekleyin veya geri yükleyin';

  @override
  String get profileMenuAboutTitle => 'Hakkımızda';

  @override
  String get profileMenuAboutSubtitle => 'Uygulama hakkında bilgi';

  @override
  String get profileMenuHelpTitle => 'Yardım ve Destek';

  @override
  String get profileMenuHelpSubtitle => 'Sıkça sorulan sorular';

  @override
  String get profileMenuPrivacyTitle => 'Gizlilik Politikası';

  @override
  String get profileMenuPrivacySubtitle =>
      'Gizlilik ve veri kullanım politikamız';

  @override
  String notifPrayerTime(String prayer) {
    return '$prayer vakti geldi.';
  }

  @override
  String get notifEveningReminder => 'Bugün namazlarını kaydetmeyi unuttun mu?';

  @override
  String notifBadgeEarned(String badgeName) {
    return 'Tebrikler! $badgeName rozetini kazandın!';
  }

  @override
  String get badgeCategoryOnboarding => 'Başlangıç';

  @override
  String get badgeCategoryStreak => 'Seri';

  @override
  String get badgeCategoryCompletion => 'Tamamlama';

  @override
  String get badgeCategoryTotalCount => 'Toplam';

  @override
  String get badgeCategoryPrayerSpecific => 'Namaz';

  @override
  String get badgeCategoryHonesty => 'Dürüstlük';

  @override
  String get badgeCategorySpecial => 'Özel';

  @override
  String get badgeCategoryMilestone => 'Kilometre Taşı';

  @override
  String get badgeIlkAdim => 'İlk Adım';

  @override
  String get badgeHosGeldin => 'Hoş Geldin';

  @override
  String get badge3GunSeri => '3 Gün Seri';

  @override
  String get badge7GunSeri => '7 Gün Seri';

  @override
  String get badge30GunSeri => '30 Gün Seri';

  @override
  String get badgeIstikrarUstasi => 'İstikrar Ustası';

  @override
  String get badgeEfsane => 'Efsane';

  @override
  String get badgeTamGun => 'Tam Gün';

  @override
  String get badgeMukemmelHafta => 'Mükemmel Hafta';

  @override
  String get badgeMukemmelAy => 'Mükemmel Ay';

  @override
  String get badge100Namaz => '100 Namaz';

  @override
  String get badge500Namaz => '500 Namaz';

  @override
  String get badge1000Namaz => '1000 Namaz';

  @override
  String get badge2000Namaz => '2000 Namaz';

  @override
  String get badgeSabahYildizi => 'Sabah Yıldızı';

  @override
  String get badgeGeceYolcusu => 'Gece Yolcusu';

  @override
  String get badgeOgleSavascisi => 'Öğle Savaşçısı';

  @override
  String get badgeKazaSavascisi => 'Kaza Savaşçısı';

  @override
  String get badgeTelafUstasi => 'Telafi Ustası';

  @override
  String get badgeRamazanRuhu => 'Ramazan Ruhu';

  @override
  String get badgeRamazanTamamladi => 'Ramazan Tamamladı';

  @override
  String get badgeCumaKrali => 'Cuma Kralı';

  @override
  String get badgeBirAy => 'Bir Ay';

  @override
  String get badgeUcAy => 'Üç Ay';

  @override
  String get badgeAltiAy => 'Altı Ay';

  @override
  String get badgeBirYil => 'Bir Yıl';

  @override
  String badgeEarnedOn(String date) {
    return '$date tarihinde kazanıldı';
  }

  @override
  String get badgeLocked => 'Kilitli';

  @override
  String get badgeCelebrationSubtitle => 'Yeni bir rozet kazandın!';

  @override
  String get cityPickerTitle => 'Şehir Seç';

  @override
  String get cityPickerSubtitle => 'Konumunu manuel olarak belirle';

  @override
  String get cityPickerHint => 'Şehir ara (örn. İstanbul)';

  @override
  String get cityPickerNoResults => 'Bu arama için sonuç bulunamadı.';

  @override
  String get cityPickerSearchFailed =>
      'Arama yapılamadı. İnternet bağlantınızı kontrol edin.';

  @override
  String get qiblaLocationNeededTitle => 'Konum gerekli';

  @override
  String get qiblaLocationNeededBody =>
      'Kıbleyi gösterebilmemiz için konumuna ihtiyacımız var. Konum izni vermek istemiyorsan şehrini manuel olarak seçebilirsin.';

  @override
  String get qiblaSelectCity => 'Şehir Seç';

  @override
  String get qiblaUseGps => 'GPS Kullan';
}
