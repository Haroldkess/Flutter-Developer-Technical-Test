import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technical_test/model/brand_model/brand_colors.dart';
import 'package:technical_test/view/widgets/text.dart';

class HeaderActions extends StatelessWidget {
  const HeaderActions({
    super.key,
    required this.tap,
    required this.figure,
    required this.figureColor,
    required this.leadingIcon,
  });
  final VoidCallback tap;
  final String leadingIcon, figure;
  final Color figureColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        SizedBox(
          height: 30.h,
          child: Card(
            elevation: 3,
            child: Container(
              height: 20.h,
              width: 75.w,
              decoration: BoxDecoration(
                color: BrandColors.appWhite,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText(
                        text: figure,
                        color: figureColor,
                        bold: true,
                      ),
                      Container(
                          height: 15,
                          width: 20.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: figureColor),
                          child: Icon(
                            Icons.add,
                            size: 12.sp,
                            color: BrandColors.appBlack,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 30.h, width: 30, child: Image.asset(leadingIcon))
            .paddingOnly(bottom: 5.h),
      ],
    );
  }
}
