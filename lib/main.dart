import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'services/presence_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (kIsWeb) {
      // Dummy options to prevent white screen on Web if real options aren't configured yet
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyDjzXYS7ZBQaWGnI9ZbXOEl_R5iVsZWBYE",
          appId:
              "1:447317744345:web:b66343a956efce3af2bcc8", // Estimated based on Android ID format
          messagingSenderId: "447317744345",
          projectId: "gupshup-2fc5c",
          storageBucket: "gupshup-2fc5c.firebasestorage.app",
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  } catch (e) {
    debugPrint('Firebase initialization failed: $e');
  }

  runApp(
    const ProviderScope(
      child: GupShupApp(),
    ),
  );
}

class GupShupApp extends ConsumerStatefulWidget {
  const GupShupApp({super.key});

  @override
  ConsumerState<GupShupApp> createState() => _GupShupAppState();
}

class _GupShupAppState extends ConsumerState<GupShupApp>
    with WidgetsBindingObserver {
  PresenceService? _presenceService;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Lazy initialization of service
    if (Firebase.apps.isNotEmpty) {
      _presenceService = PresenceService();
      _presenceService?.updateUserPresence();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (Firebase.apps.isEmpty || _presenceService == null) return;

    if (state == AppLifecycleState.resumed) {
      _presenceService?.updateUserPresence();
    } else {
      _presenceService?.setUserOffline();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GupShup',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: goRouter,
    );
  }
}
