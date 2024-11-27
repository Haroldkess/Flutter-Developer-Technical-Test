import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test/model/brand_model/brand_colors.dart';
import 'package:technical_test/view/widgets/text.dart';

class SquareButtons extends StatelessWidget {
  const SquareButtons({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: BrandColors.appWhite,
      elevation: 5,
      child: Container(
        height: 70.h,
        width: 70.w,
        decoration: BoxDecoration(
            color: BrandColors.appWhite,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30.h, width: 30.w, child: Image.asset(image)),
            SizedBox(
              height: 3.h,
            ),
            AppText(
              text: title.toUpperCase(),
              size: 8.sp,
              bold: true,
              addShadow: false,
              color: BrandColors.appBlack.withOpacity(.5),
            )
          ],
        ),
      ),
    );
  }
}
