import 'package:flutter/material.dart';
import 'package:technical_test/model/brand_model/brand_assets.dart';
import 'package:technical_test/view/widgets/background.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Background(
      asset: BrandAssets.homeBackground,
      child: Column(),
    ));
  }
}
