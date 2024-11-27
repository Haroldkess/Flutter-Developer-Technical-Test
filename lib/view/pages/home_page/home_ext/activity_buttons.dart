import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technical_test/model/brand_model/brand_assets.dart';
import 'package:technical_test/model/brand_model/brand_colors.dart';
import 'package:technical_test/view/widgets/rectangular_button.dart';
import 'package:technical_test/view/widgets/square_buttons.dart';
import 'package:badges/badges.dart' as badges;

class ActivityButtons extends StatelessWidget {
  const ActivityButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SquareButtons(
              image: BrandAssets.leaderBoard,
              title: 'Ranking',
            ).paddingOnly(bottom: 30.h),
            const VerticalButtons(),
            const SquareButtons(
              image: BrandAssets.scroll,
              title: 'Rules',
            ).paddingOnly(bottom: 30.h),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SquareButtons(
              image: BrandAssets.store,
              title: 'Store',
            ),
            badges.Badge(
              position: badges.BadgePosition.bottomEnd(),
              badgeStyle:
                  const badges.BadgeStyle(badgeColor: BrandColors.transParent),
              badgeContent: SizedBox(
                height: 25.h,
                width: 25.h,
                child: Image.asset(BrandAssets.locked),
              ),
              child: const SquareButtons(
                image: BrandAssets.characters,
                title: 'Characters',
              ),
            ),
            badges.Badge(
              position: badges.BadgePosition.bottomEnd(),
              badgeStyle:
                  const badges.BadgeStyle(badgeColor: BrandColors.transParent),
              badgeContent: SizedBox(
                height: 25.h,
                width: 25.h,
                child: Image.asset(BrandAssets.locked),
              ),
              child: const SquareButtons(
                image: BrandAssets.archievement,
                title: 'Achievements',
              ),
            ),
          ],
        )
      ],
    );
  }
}

class VerticalButtons extends StatelessWidget {
  const VerticalButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RectangularButton(
            bgColor: BrandColors.appGreen,
            text: "PLAY",
            textColor: BrandColors.appBlack),
        const RectangularButton(
            bgColor: BrandColors.appGreen,
            text: "SPEED RUN",
            textColor: BrandColors.appBlack),
        badges.Badge(
          position: badges.BadgePosition.bottomEnd(),
          badgeStyle:
              const badges.BadgeStyle(badgeColor: BrandColors.transParent),
          badgeContent: SizedBox(
            height: 25.h,
            width: 25.h,
            child: Image.asset(BrandAssets.locked),
          ),
          child: RectangularButton(
              bgColor: BrandColors.appPurple,
              text: "NOUNS HUNT",
              textColor: BrandColors.appBlack),
        ),
      ],
    );
  }
}
