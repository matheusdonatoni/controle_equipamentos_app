import 'package:controle_equipamentos/app/controllers/picture_controllers/picture_controller.dart';
import 'package:get/get.dart';

class PictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PictureController());
  }
}
