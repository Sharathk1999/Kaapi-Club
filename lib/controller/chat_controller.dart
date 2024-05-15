import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/controller/profile_controller.dart';
import 'package:kaapi_club/models/chat_model.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  var uuid =const Uuid();
  ProfileController profileController = Get.put(ProfileController());

  /// Generates a unique chat room ID based on the user IDs of the current user and the receiver.
  ///
  /// This function concatenates the user IDs in a specific order to ensure consistency
  /// in the generated chat room ID, regardless of the order in which the users' IDs are provided.
  ///
  /// [receiverUserId]: The user ID of the receiver with whom the current user will chat.
  ///
  /// Returns the generated chat room ID as a [String].
  String getChatRoomId(String receiverUserId) {
    String currentUserId = auth.currentUser!.uid;
    // Compares the first characters of the current user's ID and the receiver's ID.
    if (currentUserId[0].codeUnitAt(0) > receiverUserId[0].codeUnitAt(0)) {
      // Concatenates the user IDs in a specific order if the current user's ID comes alphabetically later.
      return currentUserId + receiverUserId;
    } else {
      // Concatenates the user IDs in a specific order if the receiver's ID comes alphabetically later.
      return receiverUserId + currentUserId;
    }
  }

  Future<void> sendMessage(String receiverUserId, String message) async {
    isLoading.value = true;
    String roomId = getChatRoomId(receiverUserId);
    String chatId = uuid.v6();
    var newChat = ChatModel(
      id: chatId,
      message: message,
      senderName: profileController.currentUser.value.name,
      senderId: auth.currentUser!.uid,
      receiverId: receiverUserId,
    );

    try {
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(newChat.toJson());
    } catch (e) {
      log(e.toString());
    }
    isLoading.value = false;
  }
}
