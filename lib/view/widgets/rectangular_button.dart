import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technical_test/view/widgets/text.dart';

class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.bgColor,
    required this.text,
    required this.textColor,
  });
  final String text;
  final Color bgColor, textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        fixedSize: Size(150.w, 60.h),
        backgroundColor: bgColor,
      ),
      child: AppText(
        text: text,
        color: textColor,
        bold: true,
        size: 14.sp,
      ),
    ).paddingSymmetric(vertical: 10);
  }
}
