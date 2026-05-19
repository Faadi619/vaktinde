import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:provider/provider.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'features/qibla/data/qibla_location_cache_model.dart';
import 'firebase_options.dart';

import 'core/constants/themes.dart';
import 'features/auth/data/auth_service.dart';
import 'features/auth/data/user_repository.dart';
import 'features/auth/providers/auth_provider.dart';
import 'features/qibla/providers/qibla_provider.dart';
import 'l10n/app_localizations.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(QiblaLocationCacheModelAdapter());
  runApp(const VaktindeApp());
}

class VaktindeApp extends StatelessWidget {
  const VaktindeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthService()),
        Provider(create: (_) => UserRepository()),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(
            authService: context.read<AuthService>(),
            userRepository: context.read<UserRepository>(),
          ),
        ),
        StreamProvider<User?>(
          create: (context) => context.read<AuthService>().authStateChanges(),
          initialData: null,
        ),
        ChangeNotifierProvider(create: (_) => QiblaProvider()),
        // TODO Phase 1: add UserProvider, LocationProvider
        // TODO Phase 2: add PrayerTimesProvider, DayRecordProvider
        // TODO Phase 4: add StreakProvider
        // TODO Phase 8: add BadgeProvider
      ],
      child: const AppRoot(),
    );
  }
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late final _router = createRouter(context);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Vaktinde',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('tr'),
      routerConfig: _router,
    );
  }
}
