import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technical_test/model/brand_model/brand_colors.dart';
import 'package:technical_test/view/widgets/text.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 140.w,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          SizedBox(
            width: 100.w,
            height: 50.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserDataInfo(
                    bgColor: BrandColors.transParent,
                    data: "6/500",
                    fontSize: 10.sp,
                    height: 15.h,
                    width: 80.w,
                    textColor: BrandColors.appWhite),
                UserDataInfo(
                    bgColor: BrandColors.appWhite,
                    data: "Harold",
                    fontSize: 11.sp,
                    height: 18.h,
                    width: 70.w,
                    textColor: BrandColors.appBlack),
              ],
            ),
          ).paddingOnly(left: 40.w),
          SizedBox(
            width: 50.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: BrandColors.appBlue,
                      border: Border.all(color: BrandColors.appWhite),
                      image: DecorationImage(image: AssetImage(image))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserDataInfo extends StatelessWidget {
  const UserDataInfo(
      {super.key,
      required this.bgColor,
      required this.data,
      required this.fontSize,
      required this.height,
      required this.textColor,
      required this.width});
  final double height, width, fontSize;
  final Color bgColor;
  final Color textColor;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: BrandColors.appWhite),
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.elliptical(20, 7))),
      child: Center(
        child: AppText(
          text: data,
          bold: true,
          addShadow: true,
          color: textColor,
          size: fontSize,
        ),
      ),
    );
  }
}
