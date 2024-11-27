import 'package:flutter/material.dart';
import 'package:technical_test/view/widgets/logo_widget.dart';

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
            offset: Offset(0, offset), child: const LogoWidget());
      },
    );
  }
}
