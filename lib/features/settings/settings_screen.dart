import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';
import '../../core/theme/app_colors.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider).value;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryContainer,
        title: Row(
          children: [
            if (userData?.photoUrl != null && userData!.photoUrl!.isNotEmpty)
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(userData.photoUrl!),
              )
            else
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white24,
                child: const Icon(Icons.person, color: Colors.white),
              ),
            const SizedBox(width: 12),
            const Text(
              'GupShup',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.outlineVariant.withValues(alpha: 0.3),
              ),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: AppColors.primaryFixed,
                      backgroundImage: (userData?.photoUrl != null &&
                              userData!.photoUrl!.isNotEmpty)
                          ? NetworkImage(userData.photoUrl as String)
                          : null,
                      child: userData?.photoUrl == null ||
                              userData!.photoUrl!.isEmpty
                          ? const Icon(Icons.person,
                              size: 40, color: AppColors.primary)
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.surfaceContainerLowest,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  userData?.displayName ?? 'User',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userData?.about ?? 'Hey there! I am using GupShup.',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSettingItem(
            context: context,
            icon: Icons.person_outline,
            title: 'Account',
            subtitle: 'Security, email change',
            featureMessage: 'Account settings - manage security, change email',
          ),
          _buildSettingItem(
            context: context,
            icon: Icons.lock_outline,
            title: 'Privacy',
            subtitle: 'Block contacts, disappear messages',
            featureMessage:
                'Privacy settings - block contacts, set disappear timer',
          ),
          _buildSettingItem(
            context: context,
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            subtitle: 'Message, group & call tones',
            featureMessage:
                'Notification settings - message tones, group alerts',
          ),
          _buildSettingItem(
            context: context,
            icon: Icons.data_usage,
            title: 'Storage & Data',
            subtitle: 'Network usage, auto-download',
            featureMessage: 'Storage & data - auto-download, network usage',
          ),
          _buildSettingItem(
            context: context,
            icon: Icons.help_outline,
            title: 'Help',
            subtitle: 'Help center, contact us',
            featureMessage: 'Help center - FAQ, contact support',
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () async {
              await ref.read(authServiceProvider).signOut();
              if (context.mounted) {
                context.go('/login');
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.errorContainer.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.errorContainer,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.logout,
                      color: AppColors.error,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.error,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    String? featureMessage,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {
            if (onTap != null) {
              onTap();
            } else if (featureMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$featureMessage - Coming soon!')),
              );
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.onSecondaryContainer,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onSurface,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.outline,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
