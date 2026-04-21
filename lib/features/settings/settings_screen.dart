import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          if (userData != null)
            ListTile(
              leading: const CircleAvatar(radius: 30, child: Icon(Icons.person)),
              title: Text(userData.displayName ?? 'User'),
              subtitle: Text(userData.about ?? 'Hey there! I am using GupShup.'),
              trailing: IconButton(
                icon: const Icon(Icons.qr_code),
                onPressed: () => context.push('/qr-profile'),
              ),
              onTap: () => context.push('/profile-setup'),
            ),
          const Divider(),
          _buildSettingTile(Icons.key, 'Account', 'Security notifications, change number'),
          _buildSettingTile(Icons.lock, 'Privacy', 'Block contacts, disappearing messages'),
          _buildSettingTile(Icons.chat, 'Chats', 'Theme, wallpapers, chat history'),
          _buildSettingTile(Icons.notifications, 'Notifications', 'Message, group & call tones'),
          _buildSettingTile(Icons.data_usage, 'Storage and data', 'Network usage, auto-download'),
          _buildSettingTile(Icons.help_outline, 'Help', 'Help center, contact us, privacy policy'),
          const Divider(),
          _buildSettingTile(Icons.group, 'Invite a friend', ''),
        ],
      ),
    );
  }

  Widget _buildSettingTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      subtitle: subtitle.isNotEmpty ? Text(subtitle, style: const TextStyle(fontSize: 12)) : null,
      onTap: () {},
    );
  }
}
