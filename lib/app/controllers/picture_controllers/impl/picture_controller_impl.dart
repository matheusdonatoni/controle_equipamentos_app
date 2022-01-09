import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/getx_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:get/get.dart';

abstract class PictureControllerImpl extends GetxControllerImpl<Picture>
    with SingleGetTickerProviderMixin {
  final _picture = Rx<Picture>((Get.arguments as Picture).copyWith());

  Picture get picture => _picture.value;
  set picture(Picture val) => _picture.value = val;

  @override
  get initial => picture;

  @override
  get stream => _picture.stream;
}
