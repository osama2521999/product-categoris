import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';

void configLoading() {
  EasyLoading.instance
    ..customAnimation = CustomAnimation()
    ..animationStyle = EasyLoadingAnimationStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black
    ..maskColor = Colors.black.withOpacity(0.3)
    ..dismissOnTap = true
    ..backgroundColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..dismissOnTap = false;
}

class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: ZoomIn(
        child: Container(
          // padding: const EdgeInsets.all(2),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Lottie.asset(
            "assets/animations/loading_circle.json",
            height: 75,
            width: 75,
            frameRate: FrameRate.max,
          ),
        ),
      ),
    );
  }
}
