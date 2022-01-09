import 'package:controle_equipamentos/app/controllers/home_controllers/impl/home_drawer_controller_impl.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:get/get.dart';

class HomeDrawerController extends HomeDrawerControllerImpl {
  Future<void> pushItemsList() async {
    await Get.toNamed(Routes.ITEMS_LIST);
  }

  Future<void> pushSettings() async {
    await Get.toNamed(Routes.SETTINGS);
  }
}
