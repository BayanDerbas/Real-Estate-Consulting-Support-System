import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduation_project/core/stripe/stripe.dart';
import 'package:graduation_project/features/Auth/presentation/pages/change_password.dart';
import 'package:graduation_project/features/Auth/presentation/pages/splash_screen.dart';
import 'package:graduation_project/core/constants/app_theme.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/Discounts/presentation/pages/Discounts.dart';
import 'package:graduation_project/features/calls/login_call.dart';
import 'package:graduation_project/features/home/presentation/pages/Home.dart';
import 'package:graduation_project/features/ticket/presentation/pages/all_tickets.dart';
import 'package:graduation_project/features/ticket/presentation/pages/base_tickets_page.dart';
import 'package:graduation_project/features/ticket/presentation/pages/filter_tickets.dart';
import 'package:graduation_project/features/wallet/presentation/pages/Wallet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'core/di/dependence_initializer.dart';
import 'core/networks/dio_factory.dart';
import 'core/notifications/firebase_messaging_service.dart';
import 'core/utils/secure_storage.dart';
import 'core/utils/shard_prefs.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import 'features/Auth/presentation/pages/login_screen.dart';
import 'features/calls/call_page.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Stripe.publishableKey = stripePublishableKey;

  await DependenceInitializer.dependenceInjection();
  await SharedPrefs.init();
  await DioFactory.loadToken();
  final storage = SecureStorage();
  final token = await storage.getToken();
  print('\nAccess Token: $token\n');
  print("...........................................................................\n");
  await StripeService.initStripe();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessagingService().init();

  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI([
    ZegoUIKitSignalingPlugin(),
  ]);

  runApp(MyApp(navigatorKey: navigatorKey));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
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
      home: Home(),
      getPages: AppRoutes.routes_,
    );
  }
}
