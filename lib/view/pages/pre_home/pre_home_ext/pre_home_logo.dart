import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test/model/brand_model/brand_assets.dart';

class PreHomeLogo extends StatelessWidget {
  const PreHomeLogo(
      {super.key,
      required this.controller,
      required this.bounceDownUpAnimationValue,
      required this.moveToTopAnimationValue});
  final AnimationController controller;
  final double bounceDownUpAnimationValue;
  final double moveToTopAnimationValue;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final offset = bounceDownUpAnimationValue + moveToTopAnimationValue;
        return Transform.translate(
          offset: Offset(0, offset),
          child: SizedBox(
            width: 200.w,
            child: Image.asset(BrandAssets.appLogo),
          ),
        );
      },
    );
  }
}
