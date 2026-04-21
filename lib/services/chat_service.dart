import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/chat_model.dart';
import '../models/message_model.dart';
import '../core/constants/app_constants.dart';

class ChatService {
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  Stream<List<ChatModel>> getChats(String uid) {
    if (Firebase.apps.isEmpty) return Stream.value([]);
    return _firestore
        .collection(AppConstants.chatsCollection)
        .where('participants', arrayContains: uid)
        .orderBy('lastMessageTime', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ChatModel.fromJson(doc.data()))
            .toList());
  }

  Stream<List<MessageModel>> getMessages(String chatId) {
    if (Firebase.apps.isEmpty) return Stream.value([]);
    return _firestore
        .collection(AppConstants.chatsCollection)
        .doc(chatId)
        .collection(AppConstants.messagesCollection)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MessageModel.fromJson(doc.data()))
            .toList());
  }

  Future<void> sendMessage(MessageModel message) async {
    if (Firebase.apps.isEmpty) return;
    final chatRef = _firestore.collection(AppConstants.chatsCollection).doc(message.chatId);
    
    final batch = _firestore.batch();
    
    final messageRef = chatRef.collection(AppConstants.messagesCollection).doc(message.messageId);
    batch.set(messageRef, message.toJson());
    
    batch.update(chatRef, {
      'lastMessage': message.content,
      'lastMessageTime': message.timestamp.toIso8601String(),
    });
    
    await batch.commit();
  }

  Future<String?> getOrCreateChatId(String uid1, String uid2) async {
    if (Firebase.apps.isEmpty) return null;
    final query = await _firestore
        .collection(AppConstants.chatsCollection)
        .where('participants', arrayContains: uid1)
        .get();
    
    for (var doc in query.docs) {
      final participants = List<String>.from(doc.data()['participants']);
      if (participants.contains(uid2) && participants.length == 2) {
        return doc.id;
      }
    }
    
    final newChat = _firestore.collection(AppConstants.chatsCollection).doc();
    await newChat.set({
      'chatId': newChat.id,
      'type': 'individual',
      'participants': [uid1, uid2],
      'unreadCount': 0,
    });
    
    return newChat.id;
  }

  Future<void> setTypingStatus(String chatId, String uid, bool isTyping) async {
    if (Firebase.apps.isEmpty) return;
    await _firestore
        .collection(AppConstants.chatsCollection)
        .doc(chatId)
        .collection('typing')
        .doc(uid)
        .set({'isTyping': isTyping});
  }

  Stream<List<String>> getTypingUsers(String chatId, String currentUid) {
    if (Firebase.apps.isEmpty) return Stream.value([]);
    return _firestore
        .collection(AppConstants.chatsCollection)
        .doc(chatId)
        .collection('typing')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .where((doc) => doc.id != currentUid && doc.data()['isTyping'] == true)
          .map((doc) => doc.id)
          .toList();
    });
  }
}
