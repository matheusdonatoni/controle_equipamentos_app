import 'dart:math';
import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'impl/picture_controller_impl.dart';

class PictureController extends PictureControllerImpl {
  final _isFullScreen = false.obs;
  bool get isFullScreen => _isFullScreen.value;
  set isFullScreen(bool val) => _isFullScreen.value = val;

  String get tag => picture.id == null ? '' : picture.id.toString();

  final pictureKey = GlobalKey();

  RenderBox get pictureBox => pictureKey.currentContext.findRenderObject();

  double get pictureWidth => pictureBox.size.width;
  double get pictureHeight => pictureBox.size.height;

  bool get isPictureMoving => updatedDragDelta != Offset.zero;
  bool get isPictureStopped => !isPictureMoving;

  Offset initialCenterPosition;
  Offset initialDragPosition = const Offset(0.0, 0.0);
  Offset updatedDragDelta = const Offset(0.0, 0.0);
  Offset updatedDragPosition = const Offset(0.0, 0.0);

  double get dx => updatedDragPosition.dx;
  double get dy => updatedDragPosition.dy;

  Tween<Offset> originPathTween = Tween<Offset>(
    end: const Offset(0.0, 0.0),
  );

  Tween<double> backgroundOpacityTween = Tween<double>(
    end: 1.0,
  );

  Animation<Offset> originPathAnimation;
  Animation<double> backgroundOpacityAnimation;

  double backgroundOpacity = 1.0;

  AnimationController animationController;

  double get leftQuarter => pictureWidth / 4;
  double get rightQuarter => 3 * leftQuarter;

  double get topQuarter => pictureHeight / 4;
  double get bottomQuarter => 3 * topQuarter;

  bool get isCurrentPositionInOutsideQuarterFrame => (dx < leftQuarter ||
      dx > rightQuarter ||
      dy < topQuarter ||
      dy > bottomQuarter);

  Offset get currentPosition => animationController.isAnimating
      ? originPathAnimation.value
      : updatedDragDelta;

  double get currentOpacity => animationController.isAnimating
      ? backgroundOpacityAnimation.value
      : backgroundOpacity;

  void onTap() {
    isFullScreen = !isFullScreen;
  }

  void onVerticalDragStart(DragStartDetails details) {
    initialDragPosition = details.localPosition;
  }

  void onVerticalDragUpdate(DragUpdateDetails details) {
    updatedDragPosition = details.localPosition;
    updatedDragDelta = updatedDragPosition - initialDragPosition;

    calculateBackgroundOpacity();

    update();
  }

  void onVerticalDragEnd(DragEndDetails details) {
    if (isCurrentPositionInOutsideQuarterFrame)
      Get.back();
    else
      animate();
  }

  void animate() {
    originPathTween.begin = updatedDragDelta;

    originPathAnimation = originPathTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutSine,
      ),
    );

    backgroundOpacityTween.begin = backgroundOpacity;

    backgroundOpacityAnimation = backgroundOpacityTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutSine,
      ),
    );

    animationController.reset();

    animationController.forward().whenComplete(
          resetViewPropreties,
        );
  }

  void setupAnimationController() {
    animationController = AnimationController(
      duration: kDuration,
      vsync: this,
    );
  }

  void resetViewPropreties() {
    updatedDragDelta = const Offset(0.0, 0.0);

    backgroundOpacity = 1.0;
  }

  void calculatePictureInitialCenter() {
    initialCenterPosition = pictureBox.localToGlobal(
      Offset(pictureWidth, pictureHeight),
    );
  }

  void calculateBackgroundOpacity() {
    double dx = (updatedDragDelta.dx).abs();
    double dy = (updatedDragDelta.dy).abs();

    double dxOpacity = 1.0 - dx * 2 / Get.width;
    double dyOpacity = 1.0 - dy * 2 / Get.height;

    double calculatedOpacity;

    calculatedOpacity = min(dxOpacity, dyOpacity);

    if (calculatedOpacity > 1.0)
      backgroundOpacity = 1.0;
    else if (calculatedOpacity < 0.0)
      backgroundOpacity = 0.0;
    else
      backgroundOpacity = calculatedOpacity;
  }

  @override
  void onInit() {
    super.onInit();

    setupAnimationController();
  }

  @override
  void onReady() {
    super.onReady();

    calculatePictureInitialCenter();
  }
}
