// ignore_for_file: deprecated_member_use
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technical_test/model/brand_model/brand_assets.dart';
import 'package:technical_test/model/brand_model/brand_colors.dart';
import 'package:technical_test/routes/go_nav.dart';
import 'package:technical_test/view/pages/home_page/home.dart';
import 'package:technical_test/view/pages/pre_home/pre_home_ext/pre_home_loader.dart';
import 'package:technical_test/view/pages/pre_home/pre_home_ext/pre_home_logo.dart';
import 'package:technical_test/view/pages/pre_home/pre_home_ext/pre_home_text.dart';
import 'package:technical_test/view/widgets/background.dart';

class PreHomeStackedLayer extends StatefulWidget {
  const PreHomeStackedLayer({super.key});

  @override
  State<PreHomeStackedLayer> createState() => _PreHomeStackedLayerState();
}

class _PreHomeStackedLayerState extends State<PreHomeStackedLayer>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _controller;
  late Animation<double> _bounceDownUpAnimation,
      _moveToTopAnimation,
      _fadeOutTextAnimation,
      _fadeOutPageAnimation,
      _fadeInIndicatorAnimation;
  int loadPercentage = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    showAnimation();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _fadeOutPageAnimation,
      builder: (context, child) {
        return Stack(
          children: [
            Opacity(
              opacity: 1, // Reverse fade for content
              child: child,
            ),
            if (_fadeOutPageAnimation.value > 0.0)
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20 *
                      _fadeOutPageAnimation
                          .value, // Blur increases with animation
                  sigmaY: 20 * _fadeOutPageAnimation.value,
                ),
                child: Container(
                  color: Colors.white.withOpacity(
                      _fadeOutPageAnimation.value), // White overlay fades in
                ),
              ),
          ],
        );
      },
      child: Background(
        asset: BrandAssets.splashThree,
        bgColor: BrandColors.appBlack,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PreHomeLogo(
                  controller: _controller,
                  bounceDownUpAnimationValue: _bounceDownUpAnimation.value,
                  moveToTopAnimationValue: _moveToTopAnimation.value,
                ),
                SizedBox(height: 20.h),
                PreHomeText(
                  fadeOutTextAnimationValue: _fadeOutTextAnimation.value,
                ),
                PreHomeLoader(
                    fadeInIndicatorAnimation: _fadeInIndicatorAnimation.value,
                    loadPercentage: loadPercentage)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAnimation() {
    _bounceDownUpAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 30).chain(
          CurveTween(curve: Curves.ease),
        ), // Move Down
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 30, end: -20).chain(
          CurveTween(curve: Curves.bounceIn),
        ), // Bounce Up
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.4)),
    );

    // Move to Top Animation (End Value Adjusted to Move to Top of Screen)
    _moveToTopAnimation = Tween<double>(
            begin: 0,
            end: -MediaQueryData.fromView(WidgetsBinding.instance.window)
                    .size
                    .height /
                2)
        .animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.4, 0.6)),
    );
    _fadeOutPageAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.47, 1.0)), // Last 2 seconds
    );
    // Text Fade Out Animation
    _fadeOutTextAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.1, 0.4)),
    );

    // Indicator Fade In Animation
    _fadeInIndicatorAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.2, 1.0)),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          _controller.forward();
        }
      });
    });
    _controller.addListener(() {
      // Update the percentage during the animation.
      final percentage = (_controller.value * 100).clamp(1, 100).toInt() * 2;

      if (percentage < 100) {
        loadPercentage = (percentage + 2);
      }

      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Go.offUntil(const Home(), transition: Transition.fadeIn);
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _controller.stop();
    } else if (state == AppLifecycleState.resumed) {
      _controller.forward();
    }
  }
}
