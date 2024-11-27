import 'package:flutter/material.dart';
import 'package:technical_test/model/brand_model/brand_colors.dart';

class PreHomeLoading extends StatelessWidget {
  const PreHomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: BrandColors.appBlack,
      body: Stack(),
    );
  }
}
