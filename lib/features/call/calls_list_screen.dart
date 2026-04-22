import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';

class CallsListScreen extends ConsumerWidget {
  const CallsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryContainer,
        title: const Text(
          'GupShup',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.primaryContainer,
              child: Row(
                children: [
                  _buildTab('All', isActive: true),
                  _buildTab('Missed', isActive: false),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Recent',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurfaceVariant,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            _buildCallItem(
              name: 'Sarah Wilson',
              time: 'Yesterday, 10:45 PM',
              isOutgoing: true,
              isVideo: false,
            ),
            _buildCallItem(
              name: 'Marcus Reed',
              time: 'Yesterday, 6:12 PM',
              isOutgoing: false,
              isVideo: true,
              isMissed: true,
            ),
            _buildCallItem(
              name: 'David Chen',
              time: 'May 24, 2:30 PM',
              isOutgoing: false,
              isVideo: true,
            ),
            _buildCallItem(
              name: 'Elena Rodriguez',
              time: 'May 23, 11:15 AM',
              isOutgoing: true,
              isVideo: true,
            ),
            _buildCallItem(
              name: 'Jameson T.',
              time: 'May 22, 9:00 AM',
              isOutgoing: false,
              isVideo: false,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryContainer,
        onPressed: () {},
        child: const Icon(Icons.add_call, color: Colors.white),
      ),
    );
  }

  Widget _buildTab(String label, {required bool isActive}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              border: isActive
                  ? const Border(
                      bottom: BorderSide(color: Colors.white, width: 2))
                  : null,
            ),
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isActive ? Colors.white : Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildCallItem({
    required String name,
    required String time,
    required bool isOutgoing,
    required bool isVideo,
    bool isMissed = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: AppColors.outlineVariant.withValues(alpha: 0.5)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.secondaryContainer,
              child: Text(
                name[0].toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSecondaryContainer,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isMissed ? AppColors.error : AppColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        isOutgoing ? Icons.call_made : Icons.call_received,
                        size: 16,
                        color: isMissed
                            ? AppColors.error
                            : isOutgoing
                                ? AppColors.primaryContainer
                                : Colors.green,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                isVideo ? Icons.videocam : Icons.call,
                color: AppColors.primaryContainer,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
