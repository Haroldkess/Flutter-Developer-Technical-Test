import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:technical_test/model/brand_model/brand_colors.dart';
import 'package:technical_test/model/brand_model/brand_names.dart';
import 'package:technical_test/view/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: BrandNames.appName,
      color: BrandColors.appBlack,
      home: SplashPage(),
    );
  }
}
