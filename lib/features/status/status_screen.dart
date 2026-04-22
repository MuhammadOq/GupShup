import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';

class StatusScreen extends ConsumerWidget {
  const StatusScreen({super.key});

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
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColors.secondaryContainer,
                        child: Icon(
                          Icons.person,
                          color: AppColors.onSecondaryContainer,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Status',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onSurface,
                        ),
                      ),
                      Text(
                        'Tap to add status update',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Recent updates',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurfaceVariant,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            _buildStatusItem(
              name: 'Sarah Wilson',
              time: '12 minutes ago',
              isNew: true,
            ),
            _buildStatusItem(
              name: 'Marcus Chen',
              time: '45 minutes ago',
              isNew: true,
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Viewed updates',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurfaceVariant,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            _buildStatusItem(
              name: 'Elena Rodriguez',
              time: 'Today, 9:15 AM',
              isNew: false,
            ),
            _buildStatusItem(
              name: 'David Park',
              time: 'Yesterday, 11:42 PM',
              isNew: false,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            mini: true,
            backgroundColor: AppColors.surfaceContainerHigh,
            onPressed: () {},
            child: const Icon(Icons.edit, color: AppColors.onSurfaceVariant),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            backgroundColor: AppColors.primaryContainer,
            onPressed: () {},
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem({
    required String name,
    required String time,
    required bool isNew,
  }) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(isNew ? 2 : 2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color:
                isNew ? AppColors.primaryContainer : AppColors.outlineVariant,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          radius: 24,
          backgroundColor:
              isNew ? AppColors.primaryFixed : AppColors.surfaceContainerHigh,
          child: Text(
            name[0].toUpperCase(),
            style: TextStyle(
              color: isNew ? AppColors.primary : AppColors.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isNew
              ? AppColors.onSurface
              : AppColors.onSurfaceVariant.withValues(alpha: 0.8),
        ),
      ),
      subtitle: Text(
        time,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.onSurfaceVariant,
        ),
      ),
    );
  }
}
