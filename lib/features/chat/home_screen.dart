import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/chat_provider.dart';
import '../../providers/auth_provider.dart';
import '../../core/theme/app_colors.dart';
import '../chat/chat_list_tile.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final chatsAsync = ref.watch(chatsStreamProvider);

    return Scaffold(
      body: _buildCurrentTab(chatsAsync),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.chat_outlined, 'Chats'),
                _buildNavItem(1, Icons.circle_notifications_outlined, 'Status'),
                _buildNavItem(2, Icons.call_outlined, 'Calls'),
                _buildNavItem(3, Icons.settings_outlined, 'Settings'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/contacts'),
        backgroundColor: AppColors.primaryContainer,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  Widget _buildCurrentTab(AsyncValue<List<dynamic>> chatsAsync) {
    switch (_currentIndex) {
      case 0:
        return _buildChatTab(chatsAsync);
      case 1:
        return _buildStatusPlaceholder();
      case 2:
        return _buildCallsPlaceholder();
      case 3:
        return _buildSettingsPlaceholder();
      default:
        return _buildChatTab(chatsAsync);
    }
  }

  Widget _buildChatTab(AsyncValue<List<dynamic>> chatsAsync) {
    final userData = ref.watch(userDataProvider).value;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 80,
          floating: true,
          pinned: true,
          backgroundColor: AppColors.primaryContainer,
          flexibleSpace: FlexibleSpaceBar(
            title: Row(
              children: [
                if (userData?.photoUrl != null &&
                    userData!.photoUrl!.isNotEmpty)
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(userData.photoUrl!),
                  )
                else
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white24,
                    child:
                        const Icon(Icons.person, size: 18, color: Colors.white),
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
            titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Search feature coming soon')),
                );
              },
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onSelected: (value) {
                switch (value) {
                  case 'new_group':
                    context.push('/create-group');
                    break;
                  case 'new_broadcast':
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('New broadcast coming soon')),
                    );
                    break;
                  case 'linked_devices':
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Linked devices coming soon')),
                    );
                    break;
                  case 'starred_messages':
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Starred messages coming soon')),
                    );
                    break;
                  case 'settings':
                    context.push('/settings');
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                    value: 'new_group', child: Text('New group')),
                const PopupMenuItem(
                    value: 'new_broadcast', child: Text('New broadcast')),
                const PopupMenuItem(
                    value: 'linked_devices', child: Text('Linked devices')),
                const PopupMenuItem(
                    value: 'starred_messages', child: Text('Starred messages')),
                const PopupMenuItem(value: 'settings', child: Text('Settings')),
              ],
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Conversations',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.onSurfaceVariant,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        '12 Total',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        chatsAsync.when(
          data: (chats) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final chat = chats[index];
                return ChatListTile(chat: chat);
              },
              childCount: chats.length,
            ),
          ),
          loading: () => const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (err, stack) => SliverFillRemaining(
            child: Center(child: Text('Error: $err')),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
      ],
    );
  }

  Widget _buildStatusPlaceholder() {
    return _buildPlaceholderTab(
      'Status',
      'Share your moments with contacts',
      Icons.circle_notifications_outlined,
    );
  }

  Widget _buildCallsPlaceholder() {
    return _buildPlaceholderTab(
      'Calls',
      'Your call history will appear here',
      Icons.call_outlined,
    );
  }

  Widget _buildSettingsPlaceholder() {
    return _buildPlaceholderTab(
      'Settings',
      'Configure your app preferences',
      Icons.settings_outlined,
    );
  }

  Widget _buildPlaceholderTab(String title, String subtitle, IconData icon) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GupShup'),
        backgroundColor: AppColors.primaryContainer,
        actions: [
          IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: AppColors.outline),
            const SizedBox(height: 16),
            Text(title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(subtitle,
                style: const TextStyle(color: AppColors.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryFixed.withValues(alpha: 0.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primaryContainer : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColors.primaryContainer : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
