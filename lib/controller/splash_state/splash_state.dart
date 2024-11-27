import 'package:get/get.dart';
import 'package:technical_test/controller/functions/operations.dart';
import 'package:technical_test/model/brand_model/brand_message.dart';
import 'package:technical_test/model/brand_model/brand_videos.dart';
import 'package:technical_test/routes/go_nav.dart';
import 'package:technical_test/view/pages/pre_home/stacked_layer.dart';
import 'package:video_player/video_player.dart';

class SplashState extends GetxController {
  VideoPlayerController playerController =
      VideoPlayerController.asset(BrandVideos.dashStudioIntro);
  @override
  void onInit() {
    super.onInit();
    listenAndPlayVideo();
  }

// Function to listen and play video
  listenAndPlayVideo() async {
    Operations.consoleLog(TestStages.stageOne);
    playerController.addListener(() => endVideoCondition());

    await playerController.initialize().then((_) {
      Operations.consoleLog(TestStages.stageTwo);
    });
    playerController.play();
    Operations.consoleLog(TestStages.stageThree);
    update();
  }

  endVideoCondition() {
    if (playerController.value.position == playerController.value.duration) {
      Go.offUntil(const PreHomeStackedLayer());
    }
  }

  disposePlayer() {
    // Dispose the player on close of state
    playerController.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    disposePlayer();
  }
}
