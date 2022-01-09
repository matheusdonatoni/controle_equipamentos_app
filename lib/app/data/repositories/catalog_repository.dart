import 'package:controle_equipamentos/app/data/models/catalog.dart';
import 'package:controle_equipamentos/app/data/models/helpers/api_exception.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/repositories/rel_repository_impl.dart';
import 'package:controle_equipamentos/app/data/models/unit.dart';

class CatalogRepository extends RelRepositoryImpl<Catalog> {
  Future<Catalog> findByUnit(int unitId) async {
    var res = await api.findCatalogByUnit(unitId);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    if (res.statusCode == 204) return null;

    return Catalog.fromMap(res.body);
  }

  @override
  Future<Catalog> create(Catalog catalog, Unit unit) async {
    var res = await api.createCatalog(catalog, unit);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return Catalog.fromMap(res.body);
  }

  @override
  Future<Catalog> update(Catalog catalog) async {
    var res = await api.updateCatalog(catalog, catalog.unitId);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return Catalog.fromMap(res.body)..machines = catalog.machines;
  }

  @override
  Future<bool> delete(Catalog catalog) async {
    var res = await api.deleteCatalog(catalog);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.isOk;
  }

  @override
  Future<Catalog> find(int id) async {
    var res = await api.findCatalog(id);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return Catalog.fromMap(res.body);
  }
}
