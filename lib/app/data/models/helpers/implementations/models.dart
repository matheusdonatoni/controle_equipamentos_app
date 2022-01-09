import 'package:controle_equipamentos/app/data/models/picture.dart';

abstract class ModelImpl<T> {
  ModelImpl({
    this.id,
    this.name,
  });

  final int id;
  final String name;

  void update(T model);

  T copyWith();
}

abstract class ModelWithPictureImpl<T> extends ModelImpl<T> {
  ModelWithPictureImpl({this.picture});

  Picture picture;

  bool get hasPicture => picture != null;
}
