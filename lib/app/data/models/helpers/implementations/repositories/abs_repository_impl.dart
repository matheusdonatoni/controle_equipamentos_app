import 'repository_impl.dart';

abstract class AbsRepositoryImpl<T> extends RepositoryImpl {
  Future<T> create(T val);

  Future<T> find(int id);

  Future<T> update(T val);

  Future<bool> delete(int id);
}
