import 'package:controle_equipamentos/app/data/models/category.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/async_tab_counter_mixin.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/selectable_rx_list.dart';
import 'package:controle_equipamentos/app/data/repositories/category_repository.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import '../category_controller.dart';

abstract class CategoriesTabControllerImpl
    extends GetxControllerImpl<List<Category>>
    with SelectableRxList<Category>, AsyncTabCounterMixin<Category> {
  CategoriesTabControllerImpl(this.parent);

  final Category parent;

  CategoryRepository get categoryRepository => Get.find();

  CategoryController get _categoryController => Get.find(
        tag: parent.id.toString(),
      );

  RxList<Category> get categories => parent.rx.categories;

  void addTabListener() => _categoryController.tabController.addListener(
        exitEditMode,
      );

  Future<int> asyncCount() async =>
      await categoryRepository.countFrom(parent).catchError(
            ContextualSnackbar.error,
          );

  @override
  get initial => categories;

  @override
  get stream => categories.stream;

  @override
  void onData(categories) async {
    updateCounter(asyncCount);
  }
}
