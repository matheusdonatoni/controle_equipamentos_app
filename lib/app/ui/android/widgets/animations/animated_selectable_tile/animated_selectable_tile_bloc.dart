import 'package:controle_equipamentos/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedSelectableTileBloc extends GetxController
    with SingleGetTickerProviderMixin {
  AnimatedSelectableTileBloc({
    this.selectionColor,
  }) {
    onInit();
  }

  final _selected = false.obs;
  bool get selected => this._selected.value;
  set selected(bool val) => this._selected.value = val;

  final Color selectionColor;

  AnimationController controller;
  Animation<double> size;
  Animation<Color> color;

  void setupController() {
    controller = AnimationController(
      vsync: this,
      duration: kDuration,
    );
  }

  void setupAnimation() {
    color = ColorTween(
      begin: Colors.transparent,
      end: selectionColor?.withOpacity(0.1) ??
          Get.theme.primaryColor.withOpacity(0.1),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
      ),
    );

    size = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
      ),
    );
  }

  void setupListener() {
    _selected.listen((val) {
      if (val) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    setupController();
    setupAnimation();
    setupListener();
  }
}
