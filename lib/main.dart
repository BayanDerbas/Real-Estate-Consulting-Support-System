import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduation_project/features/Auth/presentation/pages/change_password.dart';
import 'package:graduation_project/features/Auth/presentation/pages/splash_screen.dart';

import 'package:graduation_project/core/constants/app_theme.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/Discounts/presentation/pages/Discounts.dart';
import 'package:graduation_project/features/ticket/presentation/pages/all_tickets.dart';
import 'package:graduation_project/features/ticket/presentation/pages/base_tickets_page.dart';
import 'package:graduation_project/features/ticket/presentation/pages/filter_tickets.dart';
import 'package:graduation_project/features/wallet/presentation/pages/Wallet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // استيراد مكتبة firebase_messaging
import 'core/di/dependence_initializer.dart';
import 'core/networks/dio_factory.dart';
import 'core/utils/shard_prefs.dart';

import 'features/Auth/presentation/pages/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependenceInitializer.dependenceInjection();
  await SharedPrefs.init();
  await DioFactory.loadToken();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token = await messaging.getToken();
  if (token != null) {
    print(
      "...................................................................\n",
    );
    print("FCM Token: $token");
  } else {
    print("Failed to get FCM Token.");
  }
  print('i will refresh token heeeeeeeeeeeeeeeeeeeere');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: AppTheme.lightScheme(),
        scaffoldBackgroundColor: AppTheme.lightScheme().onPrimary,
      ),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: const [Locale('ar', 'AE'), Locale('en', 'US')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,

      home: LoginScreen(),
      getPages: AppRoutes.routes_,
    );
  }
}
