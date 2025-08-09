import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NotificationController extends GetxController {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final RxList<Map<String, String>> notifications = <Map<String, String>>[].obs;

  static const String _notificationsKey = 'stored_notifications';

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    final stored = await _storage.read(key: _notificationsKey);
    if (stored != null) {
      final decoded = jsonDecode(stored) as List<dynamic>;
      notifications.value =
          decoded.map((e) => Map<String, String>.from(e)).toList();
    }
  }

  Future<void> addNotification(Map<String, String> notification) async {
    final updated = [notification, ...notifications];
    notifications.value = updated;
    await _storage.write(key: _notificationsKey, value: jsonEncode(updated));
  }

  Future<void> clearNotifications() async {
    notifications.clear();
    await _storage.delete(key: _notificationsKey);
  }
}