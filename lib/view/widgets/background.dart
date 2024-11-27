import 'package:flutter/material.dart';
import 'package:technical_test/model/brand_model/brand_colors.dart';

class Background extends StatelessWidget {
  const Background(
      {super.key, required this.asset, required this.child, this.bgColor});
  final String asset;
  final Widget child;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor ?? BrandColors.appWhite,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(asset), fit: BoxFit.fill)),
          ),
          child
        ],
      ),
    );
  }
}
