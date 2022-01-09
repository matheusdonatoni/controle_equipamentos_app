import 'package:controle_equipamentos/app/controllers/server_pictures_controllers/server_pictures_controller.dart';
import 'package:controle_equipamentos/app/data/repositories/picture_repository.dart';
import 'package:get/get.dart';

class ServerPicturesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PictureRepository());

    Get.lazyPut(() => ServerPicturesController());
  }
}
