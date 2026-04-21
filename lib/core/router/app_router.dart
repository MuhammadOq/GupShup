import 'package:go_router/go_router.dart';
import '../../features/auth/splash_screen.dart';
import '../../features/auth/onboarding_screen.dart';
import '../../features/auth/login_screen.dart';

import '../../features/profile/profile_setup_screen.dart';
import '../../features/chat/home_screen.dart';
import '../../features/chat/individual_chat_screen.dart';
import '../../features/chat/contact_list_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/settings/qr_scanner_screen.dart';
import '../../features/profile/qr_profile_screen.dart';
import '../../features/groups/create_group_screen.dart';
import '../../features/call/call_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingScreen()),
    GoRoute(path: '/auth', builder: (context, state) => const LoginScreen()),

    GoRoute(path: '/profile-setup', builder: (context, state) => const ProfileSetupScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/chat/:chatId',
      builder: (context, state) {
        final chatId = state.pathParameters['chatId']!;
        return IndividualChatScreen(chatId: chatId);
      },
    ),
    GoRoute(path: '/contacts', builder: (context, state) => const ContactListScreen()),
    GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
    GoRoute(path: '/qr-scanner', builder: (context, state) => const QRScannerScreen()),
    GoRoute(path: '/qr-profile', builder: (context, state) => const QRProfileScreen()),
    GoRoute(path: '/create-group', builder: (context, state) => const CreateGroupScreen()),
    GoRoute(
      path: '/call/:channelId/:isVideo',
      builder: (context, state) {
        final channelId = state.pathParameters['channelId']!;
        final isVideo = state.pathParameters['isVideo'] == 'true';
        return CallScreen(channelId: channelId, isVideo: isVideo);
      },
    ),
  ],
);
