import 'package:controle_equipamentos/app/controllers/home_controllers/home_controller.dart';
import 'package:controle_equipamentos/app/ui/android/home/widgets/animated_home_app_bar.dart';
import 'package:controle_equipamentos/app/ui/android/home/widgets/view_mode_home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class HomeAppBar extends GetView<HomeController> with PreferredSizeWidget {
  const HomeAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.simpleObx(
      (state) => AnimatedHomeAppBar(),
      onEmpty: ViewModeHomeAppBar(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
