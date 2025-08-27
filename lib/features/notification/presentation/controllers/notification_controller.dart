import 'package:get/get.dart';
import 'package:graduation_project/core/networks/dio_factory.dart';
import 'package:graduation_project/features/notification/data/repositories/notification_repository.dart';
import '../../../../core/utils/secure_storage.dart';

class NotificationController extends GetxController {
  final NotificationRepository repository;

  NotificationController(this.repository);

  final SecureStorage secureStorage = SecureStorage();
  final RxList<Map<String, dynamic>> notifications = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    try {
      isLoading.value = true;
      DioFactory.loadToken();

      final result = await repository.getMyNotification(page: 0, size: 10);

      result.fold(
            (failure) {
          error.value = failure.err_message;
        },
            (response) async {
          final notifs = (response.content ?? [])
              .map((n) => n.toJson())
              .toList();

          notifications.assignAll(notifs);
          if (notifs.isNotEmpty) {
            await secureStorage.saveNotifications(notifs);
          } else {
            await secureStorage.clearNotifications();
          }
        },
      );
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addNotification(Map<String, dynamic> notification) async {
    final updated = [notification, ...notifications];
    notifications.assignAll(updated);
    await secureStorage.saveNotifications(updated);
  }

  Future<void> clearNotifications() async {
    notifications.clear();
    await secureStorage.clearNotifications();
  }
}

// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:graduation_project/features/notification/data/repositories/notification_repository.dart';
//
// class NotificationController extends GetxController {
//   final NotificationRepository repository;
//   NotificationController(this.repository);
//
//   final FlutterSecureStorage _storage = const FlutterSecureStorage();
//   final RxList<Map<String, String>> notifications = <Map<String, String>>[].obs;
//
//   static const String _notificationsKey = 'stored_notifications';
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadNotifications();
//   }
//
//   Future<void> loadNotifications() async {
//     final stored = await _storage.read(key: _notificationsKey);
//     if (stored != null) {
//       final decoded = jsonDecode(stored) as List<dynamic>;
//       notifications.value =
//           decoded.map((e) => Map<String, String>.from(e)).toList();
//     }
//   }
//
//   Future<void> addNotification(Map<String, String> notification) async {
//     final updated = [notification, ...notifications];
//     notifications.value = updated;
//     await _storage.write(key: _notificationsKey, value: jsonEncode(updated));
//   }
//
//   Future<void> clearNotifications() async {
//     notifications.clear();
//     await _storage.delete(key: _notificationsKey);
//   }
// }