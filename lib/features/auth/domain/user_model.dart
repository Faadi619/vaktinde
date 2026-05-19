import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String displayName;
  final String email;
  final DateTime createdAt;
  final bool isPro;
  final Map<String, dynamic> notifSettings;
  final String streakMode;
  final Map<String, dynamic>? location;

  const UserModel({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.createdAt,
    required this.isPro,
    required this.notifSettings,
    required this.streakMode,
    this.location,
  });

  factory UserModel.fromMap(String uid, Map<String, dynamic> map) {
    final createdAtRaw = map['createdAt'];

    return UserModel(
      uid: uid,
      displayName: (map['displayName'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      createdAt: createdAtRaw is Timestamp
          ? createdAtRaw.toDate()
          : DateTime.now(),
      isPro: (map['isPro'] ?? false) as bool,
      notifSettings:
          (map['notifSettings'] ?? <String, dynamic>{}) as Map<String, dynamic>,
      streakMode: (map['streakMode'] ?? 'any') as String,
      location: map['location'] as Map<String, dynamic>?,
    );
  }

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      displayName: user.displayName ?? '',
      email: user.email ?? '',
      createdAt: DateTime.now(),
      isPro: false,
      notifSettings: defaultNotifSettings,
      streakMode: 'any',
      location: null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'email': email,
      'createdAt': Timestamp.fromDate(createdAt),
      'isPro': isPro,
      'notifSettings': notifSettings,
      'streakMode': streakMode,
      'location': location,
    };
  }

  static const Map<String, dynamic> defaultNotifSettings = <String, dynamic>{
    'fajr': true,
    'dhuhr': true,
    'asr': true,
    'maghrib': true,
    'isha': true,
    'eveningReminderEnabled': true,
    'eveningTime': '21:00',
    'permissionGranted': false,
  };
}
