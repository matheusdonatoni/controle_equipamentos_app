import 'package:controle_equipamentos/app/controllers/home_controllers/home_controller.dart';
import 'package:controle_equipamentos/app/ui/android/home/widgets/machine_list.dart';
import 'package:controle_equipamentos/app/ui/android/home/widgets/home_app_bar.dart';
import 'package:controle_equipamentos/app/ui/android/home/widgets/home_drawer.dart';
import 'package:controle_equipamentos/app/ui/android/home/widgets/no_catalog_warning.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/home_floating_action_button.dart';

class HomePage extends GetView<HomeController> {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      floatingActionButton: HomeFloatingActionButton(),
      appBar: HomeAppBar(),
      body: controller.obx(
        (_) => MachineList(),
        onEmpty: NoCatalogWarning(),
      ),
    );
  }
}
