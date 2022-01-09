import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/selectable_rx_list.dart';
import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/data/repositories/picture_repository.dart';
import 'package:get/get.dart';

abstract class ServerPicturesControllerImpl
    extends GetxControllerImpl<List<Picture>> with SelectableRxList<Picture> {
  PictureRepository get pictureRepository => Get.find();
  @override
  int get selectionLimit => 1;

  final pictures = RxList<Picture>();

  @override
  get initial => pictures;

  @override
  get stream => pictures.stream;
}
