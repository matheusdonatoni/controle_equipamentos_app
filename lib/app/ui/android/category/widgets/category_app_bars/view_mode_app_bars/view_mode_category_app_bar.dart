import 'package:controle_equipamentos/app/controllers/category_controllers/category_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/popup_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../category_tab_bar.dart';
import '../../../../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class ViewModeCategoryAppBar extends GetView<CategoryController> {
  final double elevation;
  const ViewModeCategoryAppBar(
    this.tag, {
    this.elevation = 4.0,
    Key key,
  }) : super(key: key);

  const ViewModeCategoryAppBar.withoutElevation(
    this.tag, {
    Key key,
  })  : elevation = 0.0,
        super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      title: controller.simpleObx(
        (state) => Text(state.name),
        onEmpty: const Text('Seção'),
      ), //
      actions: [
        controller.simpleObx(
          (state) => PopupActionButton(
            onSelected: controller.onActionSelected,
          ),
        ),
      ],
      bottom: CategoryTabBar(tag),
    );
  }
}
