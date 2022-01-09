import 'package:controle_equipamentos/app/controllers/category_controllers/categories_tab_controller.dart';
import 'package:controle_equipamentos/app/ui/android/category/widgets/empty_sub_category_list.dart';
import 'package:controle_equipamentos/app/ui/android/category/widgets/sub_category_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryTabView extends GetView<CategoriesTabController> {
  const SubCategoryTabView(this.tag, {Key key}) : super(key: key);

  @override
  final String tag;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => WillPopScope(
        onWillPop: controller.onWillPop,
        child: SubCategoryList(tag),
      ),
      onEmpty: EmptySubCategoryList(),
    );
  }
}
