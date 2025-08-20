import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../features/notification/presentation/controllers/notification_controller.dart';
import '../constants/colors.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _notificationsKey = 'stored_notifications';

  Future<void> init() async {
    await _requestPermission();

    final token = await _messaging.getToken();
    print("\nFCM Token\n: $token\n");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("Foreground Message: ${message.notification?.title}");

      if (message.notification != null) {
        final notification = {
          'title': message.notification!.title ?? '',
          'body': message.notification!.body ?? '',
          'timestamp': DateTime.now().toIso8601String(),
        };
        await _storeNotification(notification);
        final controller = Get.find<NotificationController>();
        await controller.addNotification(notification);

        Get.snackbar(
          notification['title'] ?? '',
          notification['body'] ?? '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.deepNavy,
          colorText: AppColors.pureWhite,
          duration: const Duration(seconds: 4),
          margin: const EdgeInsets.all(12),
          borderRadius: 8,
          snackStyle: SnackStyle.FLOATING,
          boxShadows: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Notification clicked: ${message.notification?.title}");
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission();
    print('Permission granted: ${settings.authorizationStatus}');
  }

  Future<void> _storeNotification(Map<String, String> notification) async {
    final existing = await _storage.read(key: _notificationsKey);
    List<Map<String, String>> notifications = [];

    if (existing != null) {
      final decoded = jsonDecode(existing) as List<dynamic>;
      notifications = decoded.map((e) => Map<String, String>.from(e)).toList();
    }

    notifications.insert(0, notification);
    await _storage.write(key: _notificationsKey, value: jsonEncode(notifications));
  }

  Future<List<Map<String, String>>> getStoredNotifications() async {
    final stored = await _storage.read(key: _notificationsKey);
    if (stored == null) return [];
    final decoded = jsonDecode(stored) as List<dynamic>;
    return decoded.map((e) => Map<String, String>.from(e)).toList();
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Background message: ${message.messageId}");
  }
}