// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Vaktinde';

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
  String get statsTotalPrayers => 'Toplam Namaz';

  @override
  String get statsTotalDays => 'Toplam Gün';

  @override
  String get statsCompletionRate => 'Tamamlanma Oranı';

  @override
  String get statsThisWeek => 'Bu Hafta';

  @override
  String get statsThisMonth => 'Bu Ay';

  @override
  String get statsThisYear => 'Bu Yıl';

  @override
  String get statsBestMonth => 'En İyi Ay';

  @override
  String get qiblaTitle => 'Kıble';

  @override
  String get qiblaSubtitle => 'Kıble yönünü bul';

  @override
  String get qiblaMapButton => 'Harita';

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
  String get qiblaInstructionsTitle => 'Nasıl Kullanılır?';

  @override
  String get qiblaInstruction1 =>
      'Telefonu yatay tutun ve çevrenizden uzak durun.';

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
}
