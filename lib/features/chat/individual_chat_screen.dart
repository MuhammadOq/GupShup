import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/chat_provider.dart';
import '../../providers/auth_provider.dart';
import '../../models/message_model.dart';
import '../../models/enums.dart';
import '../../core/theme/app_colors.dart';
import '../../services/gemini_service.dart';
import 'message_bubble.dart';

class IndividualChatScreen extends ConsumerStatefulWidget {
  final String chatId;
  const IndividualChatScreen({super.key, required this.chatId});

  @override
  ConsumerState<IndividualChatScreen> createState() => _IndividualChatScreenState();
}

class _IndividualChatScreenState extends ConsumerState<IndividualChatScreen> {
  final _messageController = TextEditingController();
  final GeminiService _geminiService = GeminiService();
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final isNotEmpty = _messageController.text.isNotEmpty;
    if (isNotEmpty != _isTyping) {
      setState(() => _isTyping = isNotEmpty);
      final currentUser = ref.read(authStateProvider).value;
      if (currentUser != null) {
        ref.read(chatServiceProvider).setTypingStatus(widget.chatId, currentUser.uid, _isTyping);
      }
    }
  }

  @override
  void dispose() {
    _messageController.removeListener(_onTextChanged);
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final content = _messageController.text.trim();
    if (content.isEmpty) return;
    
    final user = ref.read(authStateProvider).value;
    if (user != null) {
      final message = MessageModel(
        messageId: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: user.uid,
        chatId: widget.chatId,
        content: content,
        type: MessageType.text,
        timestamp: DateTime.now(),
        status: MessageStatus.sent,
      );
      
      ref.read(chatServiceProvider).sendMessage(message);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final messagesAsync = ref.watch(messagesStreamProvider(widget.chatId));
    final currentUser = ref.watch(authStateProvider).value;
    final typingUsersAsync = ref.watch(typingUsersProvider(widget.chatId));

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Chat'),
            typingUsersAsync.when(
              data: (users) => users.isNotEmpty
                  ? const Text('typing...', style: TextStyle(fontSize: 12, color: Colors.white70))
                  : const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.videocam), onPressed: () => context.push('/call/${widget.chatId}/true')),
          IconButton(icon: const Icon(Icons.call), onPressed: () => context.push('/call/${widget.chatId}/false')),
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'summarize') {
                final messages = ref.read(messagesStreamProvider(widget.chatId)).value;
                if (messages != null && messages.isNotEmpty) {
                  final summary = await _geminiService.summarizeChat(
                    messages.take(10).map((m) => m.content).toList(),
                  );
                  if (!context.mounted) return;
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('AI Summary'),
                      content: Text(summary ?? 'Could not generate summary.'),
                      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
                    ),
                  );
                }
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'view_contact', child: Text('View contact')),
              const PopupMenuItem(value: 'media', child: Text('Media, links, and docs')),
              const PopupMenuItem(value: 'search', child: Text('Search')),
              const PopupMenuItem(value: 'summarize', child: Text('Summarize Chat (AI)')),
              const PopupMenuItem(value: 'mute', child: Text('Mute notifications')),
              const PopupMenuItem(value: 'wallpaper', child: Text('Wallpaper')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: messagesAsync.when(
              data: (messages) => ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isMe = message.senderId == currentUser?.uid;
                  return MessageBubble(message: message, isMe: isMe);
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    IconButton(icon: const Icon(Icons.emoji_emotions_outlined), onPressed: () {}),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: 'Message',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(icon: const Icon(Icons.attach_file), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.camera_alt), onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: AppColors.primary,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
