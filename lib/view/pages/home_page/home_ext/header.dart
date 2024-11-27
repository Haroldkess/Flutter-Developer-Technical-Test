import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technical_test/model/brand_model/brand_assets.dart';
import 'package:technical_test/model/brand_model/brand_colors.dart';
import 'package:technical_test/view/widgets/actions.dart';
import 'package:technical_test/view/widgets/avatar.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Avatar(
          image: BrandAssets.image,
        ),
        Row(
          children: [
            HeaderActions(
              tap: () {},
              figure: "4730",
              figureColor: BrandColors.loadColor,
              leadingIcon: BrandAssets.coin,
            ),
            SizedBox(
              width: 2.w,
            ),
            HeaderActions(
              tap: () {},
              figure: "0",
              figureColor: BrandColors.appBlue.withOpacity(.5),
              leadingIcon: BrandAssets.pencil,
            ),
          ],
        )
      ],
    ).paddingOnly(top: 10.h);
  }
}
