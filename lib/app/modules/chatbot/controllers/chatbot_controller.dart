import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final String timestamp;
  final bool isRead;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.isRead = false,
  });
}

class ChatbotController extends GetxController {
  final messageController = TextEditingController();
  final chatMessages = <ChatMessage>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Add initial bot message for demo purposes
    addBotMessage("Welcome to LiveChat");
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      final String message = messageController.text;
      final now = DateTime.now();
      final String formattedTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} PM";
      
      // Add user message
      chatMessages.add(ChatMessage(
        text: message,
        isUser: true,
        timestamp: formattedTime,
        isRead: false,
      ));
      
      // Clear input field
      messageController.clear();
      
      // Mark message as read after a delay (simulating server response)
      Future.delayed(const Duration(seconds: 1), () {
        final index = chatMessages.length - 1;
        if (index >= 0) {
          final message = chatMessages[index];
          chatMessages[index] = ChatMessage(
            text: message.text,
            isUser: message.isUser,
            timestamp: message.timestamp,
            isRead: true,
          );
        }
      });
      
      // Simulate bot response
      Future.delayed(const Duration(seconds: 2), () {
        addBotMessage("Thanks for your message! How can I help you today?");
      });
    }
  }

  void addBotMessage(String message) {
    final now = DateTime.now();
    final String formattedTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} PM";
    
    chatMessages.add(ChatMessage(
      text: message,
      isUser: false,
      timestamp: formattedTime,
    ));
  }
}