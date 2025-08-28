import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/app_keys.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/shard_prefs.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 0;

  @override
  RouteSettings? redirect(String? route) {
    // fot test
    // return RouteSettings(name: AppRoutes.createProperty);

    // if (SharedPrefs.getString(AppKeys.toRoute) == "/check-status-page") {
    //   return RouteSettings(name:"/check-status-page");
    // }
    //important
    //important
    if (SharedPrefs.getString(AppKeys.toRoute) == AppRoutes.refreshToken) {
      return RouteSettings(name: AppRoutes.refreshToken);
    }
    return null;
  }
}
