import 'package:controle_equipamentos/app/data/models/helpers/api_exception.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/repositories/ref_repository_impl.dart';
import 'package:controle_equipamentos/app/data/models/unit.dart';

class UnitRepository extends RefRepositoryImpl<Unit> {
  @override
  Future<List<Unit>> findAll() async {
    var res = await api.findAllUnits();

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return List<Unit>.from(
      (res.body).map(
        (mappedUnit) => Unit.fromMap(
          mappedUnit,
        ),
      ),
    );
  }
}
