import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduation_project/features/Auth/presentation/pages/change_password.dart';
import 'package:graduation_project/features/Book/presentation/pages/Book.dart';
import 'package:graduation_project/features/Book/presentation/pages/Confirm.dart';
import 'package:graduation_project/features/home/presentation/pages/Home.dart';
import 'package:graduation_project/features/scheduleTime/presentation/pages/ScheduleTime.dart';
import 'package:graduation_project/features/search/presentation/pages/appointments.dart';
import 'package:graduation_project/features/service%20provider/presentation/pages/ServiceProviderProfile.dart';
import 'package:graduation_project/features/service%20provider/presentation/widgets/Custom_ServiceProviderProfile.dart';
import 'package:graduation_project/core/constants/app_theme.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/Discounts/presentation/pages/Discounts.dart';
import 'package:graduation_project/features/wallet/presentation/pages/Wallet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // استيراد مكتبة firebase_messaging
import 'core/di/dependence_initializer.dart';
import 'core/utils/shard_prefs.dart';
import 'features/Auth/presentation/pages/login_screen.dart';
import 'features/Auth/presentation/pages/otp_page.dart';
import 'features/Auth/presentation/pages/sign_up_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependenceInitializer.dependenceInjection();
  await SharedPrefs.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token = await messaging.getToken();
  print(
    "...................................................................\n",
  );
  print("FCM Token: $token");

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
      home: const LoginScreen(),
      getPages: AppRoutes.routes_,
    );
  }
}
