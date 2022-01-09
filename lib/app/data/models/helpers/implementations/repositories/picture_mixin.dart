import 'package:controle_equipamentos/app/data/repositories/picture_repository.dart';

import '../../../picture.dart';

mixin PictureManagerMixin {
  final pictureRepository = PictureRepository();

  Future<Picture> createPicture(Picture picture) async {
    if (picture != null && picture.isNew && picture.hasFile) {
      picture = await pictureRepository.create(picture);
    }

    return picture;
  }

  Future<Picture> findPicture(int id) async {
    if (id == null) return Picture();

    return await pictureRepository.find(id);
  }
}
