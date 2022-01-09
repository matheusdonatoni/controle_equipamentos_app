import 'repository_impl.dart';

abstract class RefRepositoryImpl<T> extends RepositoryImpl {
  Future<List<T>> findAll();
}
