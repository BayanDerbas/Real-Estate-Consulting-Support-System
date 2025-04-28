import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graduation_project/core/constants/app_theme.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/Auth/presentation/pages/login_screen.dart';
import 'package:graduation_project/features/Auth/presentation/pages/sign_up_screen.dart';

import 'features/Auth/presentation/pages/upload_documents.dart';
import 'features/Auth/presentation/widgets/base_auth_screen.dart';
import 'features/home/presentation/pages/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(colorScheme: AppTheme.lightScheme()),
      debugShowCheckedModeBanner: false,
      home: UploadDocuments(),
      getPages: AppRoutes.routes_,
    );
  }
}
