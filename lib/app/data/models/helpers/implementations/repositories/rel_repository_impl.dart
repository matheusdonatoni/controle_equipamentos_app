import 'package:controle_equipamentos/app/data/models/helpers/implementations/repositories/repository_impl.dart';

abstract class RelRepositoryImpl<T> extends RepositoryImpl {
  //Future<T> create(T val, int ref);

  Future<T> find(int id);

  Future<T> update(T val);

  // Future<bool> delete(int id);
}
