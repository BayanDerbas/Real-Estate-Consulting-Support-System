import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:zego_uikit/zego_uikit.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduation_project/core/stripe/stripe.dart';
import 'package:graduation_project/core/translation/locale.dart';
import 'package:graduation_project/core/translation/locale_controller.dart';
import 'package:graduation_project/core/constants/app_theme.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/di/dependence_initializer.dart';
import 'core/networks/dio_factory.dart';
import 'core/notifications/firebase_messaging_service.dart';
import 'core/utils/secure_storage.dart';
import 'core/utils/shard_prefs.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
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
  print(
    "...........................................................................\n",
  );

  final languageController = Get.put(LanguageController());

  await StripeService.initStripe();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessagingService().init();

  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI([
      ZegoUIKitSignalingPlugin(),
    ]);

    runApp(
      MyApp(navigatorKey: navigatorKey, languageController: languageController),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.navigatorKey,
    required this.languageController,
  });
  final GlobalKey<NavigatorState> navigatorKey;
  final LanguageController languageController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        navigatorKey: navigatorKey,
        theme: ThemeData(
          colorScheme: AppTheme.lightScheme(),
          scaffoldBackgroundColor: AppTheme.lightScheme().onPrimary,
        ),
        translations: MyLocale(),
        locale: languageController.currentLocale.value,
        fallbackLocale: const Locale('en', 'US'),
        supportedLocales: const [Locale('ar', 'AE'), Locale('en', 'US')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        //   home: Appointments(),
        getPages: AppRoutes.routes_,
      );
    });
  }
}
