import 'package:controle_equipamentos/app/data/models/helpers/api_exception.dart';
import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/data/providers/api.dart';
import 'package:get/get.dart';

class PictureRepository {
  Api get _api => Get.find();

  Future<Picture> create(Picture picture) async {
    var res = await _api.createPicture(picture);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    picture = Picture.fromMap(res.body).copyWith(file: picture.file);

    return picture;
  }

  Future<Picture> update(Picture picture) async {
    var res = await _api.updatePicture(picture);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    picture = Picture.fromMap(res.body).copyWith(file: picture.file);

    return picture;
  }

  Future<Picture> find(int id) async {
    var res = await _api.findPicture(id);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    var picture = Picture.fromMap(res.body);

    return picture;
  }

  Future<int> count() async {
    var res = await _api.countPictures();

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.body;
  }

  Future<List<Picture>> findSlice({
    int from,
    int to,
    bool shouldFetchData = true,
  }) async {
    var res = await _api.findSlicePictures(
      from: from,
      to: to,
    );

    if (res.hasError) {
      throw ApiException(res.body);
    }

    var pictures = List<Picture>.from(
      (res.body).map(
        (mappedPicture) => Picture.fromMap(mappedPicture),
      ),
    );

    return pictures;
  }

  Future<bool> delete(Picture picture) async {
    var res = await _api.deletePicture(picture);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.isOk;
  }
}
