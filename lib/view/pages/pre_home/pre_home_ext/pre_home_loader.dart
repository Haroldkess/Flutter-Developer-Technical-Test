import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test/model/brand_model/brand_colors.dart';
import 'package:technical_test/model/brand_model/brand_message.dart';
import 'package:technical_test/utils/dimensions.dart';
import 'package:technical_test/view/widgets/text.dart';

class PreHomeLoader extends StatelessWidget {
  const PreHomeLoader(
      {super.key,
      required this.fadeInIndicatorAnimation,
      required this.loadPercentage});
  final double fadeInIndicatorAnimation;
  final int loadPercentage;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: fadeInIndicatorAnimation,
      child: Container(
        width: 250.w,
        height: Dimensions.titleWidth.h,
        decoration: BoxDecoration(
            color: BrandColors.appBlack.withOpacity(.3),
            borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            SizedBox(
              width: 70.w,
              height: Dimensions.titleWidth.h,
              child: LinearProgressIndicator(
                value: loadPercentage / 100,
                backgroundColor: BrandColors.appBlack.withOpacity(.3),
                color: BrandColors.loadColor,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text:
                        "${BrandMessage.loaderText}${loadPercentage.toDouble()}%",
                    size: 12.sp,
                    color: Colors.white,
                    bold: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
