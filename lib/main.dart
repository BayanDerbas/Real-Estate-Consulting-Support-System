import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduation_project/features/Book/presentation/pages/Book.dart';
import 'package:graduation_project/features/Book/presentation/pages/Confirm.dart';
import 'package:graduation_project/features/home/presentation/pages/Home.dart';
import 'package:graduation_project/features/scheduleTime/presentation/pages/ScheduleTime.dart';
import 'package:graduation_project/features/search/presentation/pages/appointments.dart';
import 'package:graduation_project/features/service%20provider/presentation/pages/ServiceProviderProfile.dart';
import 'core/constants/app_theme.dart';
import 'core/routes/routes.dart';
import 'features/wallet/presentation/pages/Wallet.dart';

void main() {
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
      home: Scheduletime(),
      getPages: AppRoutes.routes_,
    );
  }
}
