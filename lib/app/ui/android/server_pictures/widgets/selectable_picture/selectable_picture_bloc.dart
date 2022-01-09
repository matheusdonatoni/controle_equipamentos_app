import 'package:controle_equipamentos/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectablePictureBloc extends GetxController
    with SingleGetTickerProviderMixin {
  SelectablePictureBloc() {
    onInit();
  }

  final _selected = false.obs;
  bool get selected => this._selected.value;
  set selected(bool val) => this._selected.value = val;

  AnimationController controller;
  Animation<double> size;

  void setupController() {
    controller = AnimationController(
      vsync: this,
      duration: kDuration,
    );
  }

  void setupAnimation() {
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
