import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test/model/brand_model/brand_names.dart';
import 'package:technical_test/view/widgets/text.dart';

class PreHomeText extends StatelessWidget {
  const PreHomeText({super.key, required this.fadeOutTextAnimationValue});
  final double fadeOutTextAnimationValue;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: fadeOutTextAnimationValue,
      child: SizedBox(
        width: 300.w,
        child: AppText(
          text: BrandNames.disclamar,
          size: 12.sp,
          lines: 2,
        ),
      ),
    );
  }
}
