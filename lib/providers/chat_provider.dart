import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/chat_service.dart';
import '../models/chat_model.dart';
import '../models/message_model.dart';
import 'auth_provider.dart';

final chatServiceProvider = Provider((ref) => ChatService());

final chatsStreamProvider = StreamProvider<List<ChatModel>>((ref) {
  final user = ref.watch(authStateProvider).value;
  if (user != null) {
    return ref.watch(chatServiceProvider).getChats(user.uid);
  }
  return Stream.value([]);
});

final messagesStreamProvider = StreamProvider.family<List<MessageModel>, String>((ref, chatId) {
  return ref.watch(chatServiceProvider).getMessages(chatId);
});

final typingUsersProvider = StreamProvider.family<List<String>, String>((ref, chatId) {
  final user = ref.watch(authStateProvider).value;
  return ref.watch(chatServiceProvider).getTypingUsers(chatId, user?.uid ?? '');
});
