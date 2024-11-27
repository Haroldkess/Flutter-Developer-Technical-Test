// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/controller/splash_state/splash_state.dart';
import 'package:technical_test/model/brand_model/brand_colors.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  final state = Get.put(SplashState());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.appBlack,
      body: Center(
        child: GetBuilder(
            init: state,
            builder: (video) {
              return _videoHolder(video);
            }),
      ),
    );
  }
}

//Holds and renders the brand video
// ignore: unused_element
class _videoHolder extends StatelessWidget {
  const _videoHolder(this.state);
  final SplashState state;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: state.playerController.value.aspectRatio,
        child: VideoPlayer(state.playerController));
  }
}
