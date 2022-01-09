import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/state_mixin_extension.dart';
import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

import 'impl/server_pictures_controller_impl.dart';

class ServerPicturesController extends ServerPicturesControllerImpl {
  Future<int> get countAllPictures async => await pictureRepository.count();

  Future<bool> get shouldFetchMoreData async =>
      pictures.length < await countAllPictures;

  int get pictureCountPerPage => 30;

  int get from => pictures?.length ?? 0;
  int get to => from + pictureCountPerPage;

  Future<void> onLoadingPortionReached() async {
    if (await shouldFetchMoreData) {
      changeToLoadingMore();

      await findPictures();
    }
  }

  Future<void> findPictures() async {
    changeToLoading();

    await pictureRepository.findSlice(from: from, to: to).then(
          pictures.addAll,
          onError: ContextualSnackbar.error,
        );
  }

  Future<void> pushPicturePage(Picture picture) async {
    await Get.toNamed(
      Routes.PICTURE,
      arguments: picture,
    );
  }

  void popWithPicture() {
    Get.back(result: selectedTiles.single);
  }

  @override
  void onInit() async {
    super.onInit();

    await findPictures();
  }

  @override
  Future<void> onTileTap(Picture picture) async {
    if (isNotAtEditMode) {
      await pushPicturePage(picture);
    } else {
      onEditModeCallback(picture);
    }
  }
}
