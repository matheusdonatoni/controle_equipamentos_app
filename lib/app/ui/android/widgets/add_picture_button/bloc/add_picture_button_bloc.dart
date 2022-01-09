import 'dart:io';

import 'package:controle_equipamentos/app/data/models/helpers/enums.dart';
import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../picture_source_options_bottom_sheet.dart';
import '../remove_picture_bottom_sheet.dart';

class AddPictureButtonBloc extends GetxController {
  AddPictureButtonBloc(
    this.picture, {
    this.onChanged,
    this.showServerSource = true,
  });

  final Picture picture;
  final void Function(Picture) onChanged;
  final bool showServerSource;

  Picture _picture;

  bool get hasPicture => _picture != null;
  bool get isEmpty => !hasPicture;

  Future<void> onPressed() async {
    if (isEmpty) {
      await selectFile();
    } else {
      await pushPicturePage();
    }
  }

  Future<void> onLongPress() async {
    if (hasPicture) {
      var result = await showRemovePictureBottomSheet();

      if (result) {
        _onChanged(null);
      }
    }
  }

  Future<void> selectFile() async {
    var source = await showPictureSourceOptionsBottomSheet();

    switch (source) {
      case PictureSource.camera:
        {
          await callImagePicker(ImageSource.camera);
          break;
        }
      case PictureSource.gallery:
        {
          await callImagePicker(ImageSource.gallery);
          break;
        }
      case PictureSource.server:
        {
          _onChanged(
            (await Get.toNamed(
              Routes.SERVER_PICTURES,
            ) as Picture),
          );
          break;
        }
      default:
        {
          break;
        }
    }
  }

  Future<void> callImagePicker(ImageSource source) async {
    ImagePicker _picker = ImagePicker();

    var _pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 0,
    );

    if (_pickedFile != null) {
      var file = await cropImage(File(_pickedFile.path));

      if (file != null) {
        try {
          file = await treatFile(file);

          if (file != null) {
            _onChanged(Picture.fromFile(file));
          } else {
            _onChanged(null);
          }
        } catch (e) {
          ContextualSnackbar.info(
            title: 'Erro',
            message: 'Não foi possível selecionar esta imagem.',
          );
        }
      }
    }
  }

  Future<File> cropImage(File file) async {
    return await ImageCropper.cropImage(
      sourcePath: file.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Recortar Imagem',
        toolbarColor: Get.theme.primaryColor,
        toolbarWidgetColor: Get.theme.primaryTextTheme.button.color,
        initAspectRatio: CropAspectRatioPreset.square,
        activeControlsWidgetColor: Get.theme.primaryColor,
        hideBottomControls: true,
        lockAspectRatio: true,
      ),
    );
  }

  Future<void> pushPicturePage() async {
    await Get.toNamed(
      Routes.PICTURE,
      arguments: _picture,
    );
  }

  Future<File> treatFile(File file) async {
    if (await file.exists()) {
      file = await file.rename(file.path.split('image_cropper_').join());

      var bytes = await file.readAsBytes();

      if ((bytes.lengthInBytes / 1024) < 1024) {
        return file;
      }

      bytes = await FlutterImageCompress.compressWithList(
        bytes,
        minHeight: 720,
        minWidth: 1280,
        quality: 70,
        keepExif: true,
      );

      return await file.writeAsBytes(bytes);
    }

    return null;
  }

  void _onChanged(Picture picutre) {
    if (onChanged != null) {
      _picture = picutre;

      onChanged(_picture);
    }
  }

  Future<PictureSource> showPictureSourceOptionsBottomSheet() async {
    return await Get.bottomSheet(
      PictureSourceOptionsBottomSheet(
        showServerSource: showServerSource,
      ),
    ) as PictureSource;
  }

  Future<bool> showRemovePictureBottomSheet() async {
    return await Get.bottomSheet(
          RemovePictureBottomSheet(),
        ) as bool ??
        false;
  }

  @override
  void onInit() {
    super.onInit();

    _picture = picture;
  }
}
