import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technical_test/model/brand_model/brand_assets.dart';
import 'package:technical_test/view/pages/home_page/home_ext/activity_buttons.dart';
import 'package:technical_test/view/pages/home_page/home_ext/header.dart';
import 'package:technical_test/view/widgets/background.dart';
import 'package:technical_test/view/widgets/logo_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Background(
        asset: BrandAssets.homeBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Header(),
                SizedBox(
                  height: 60.h,
                ),
                const LogoWidget()
              ],
            ),
            const ActivityButtons()
          ],
        ).paddingAll(10),
      )),
    );
  }
}
