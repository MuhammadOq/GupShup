import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/chat_provider.dart';
import '../../core/theme/app_colors.dart';
import '../chat/chat_list_tile.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatsAsync = ref.watch(chatsStreamProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GupShup'),
          actions: [
            IconButton(icon: const Icon(Icons.camera_alt_outlined), onPressed: () => context.push('/qr-scanner')),
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'settings') context.push('/settings');
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'new_group', child: Text('New group')),
                const PopupMenuItem(value: 'new_broadcast', child: Text('New broadcast')),
                const PopupMenuItem(value: 'linked_devices', child: Text('Linked devices')),
                const PopupMenuItem(value: 'starred_messages', child: Text('Starred messages')),
                const PopupMenuItem(value: 'settings', child: Text('Settings')),
              ],
            ),
          ],
          bottom: const TabBar(
            indicatorColor: AppColors.accent,
            tabs: [
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            chatsAsync.when(
              data: (chats) => ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ChatListTile(chat: chat);
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
            const Center(child: Text('Status Screen')),
            const Center(child: Text('Calls Screen')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push('/contacts'),
          backgroundColor: AppColors.accent,
          child: const Icon(Icons.message, color: Colors.white),
        ),
      ),
    );
  }
}
