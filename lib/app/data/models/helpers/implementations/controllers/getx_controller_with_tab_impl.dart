import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_controller_impl.dart';

abstract class GetxControllerWithTabImpl<T> extends GetxControllerImpl<T>
    with SingleGetTickerProviderMixin {
  final _index = Rx<int>(0);

  int get index => _index.value;

  TabController _tabController;
  TabController get tabController => _tabController;

  void _setupTabController() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );

    _addTabControllerListener();
  }

  void _addTabControllerListener() {
    tabController.addListener(
      () => _index.value = tabController.index,
    );
  }

  @override
  void onInit() {
    super.onInit();

    _setupTabController();
  }

  @override
  void onClose() {
    try {
      tabController.dispose();
    } catch (_) {}

    super.onClose();
  }
}
