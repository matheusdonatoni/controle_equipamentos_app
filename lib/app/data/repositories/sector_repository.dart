import 'package:controle_equipamentos/app/data/models/helpers/api_exception.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/repositories/ref_repository_impl.dart';
import 'package:controle_equipamentos/app/data/models/sector.dart';

class SectorRepository extends RefRepositoryImpl<Sector> {
  @override
  Future<List<Sector>> findAll() async {
    var res = await api.findAllSectors();

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return List<Sector>.from(
      (res.body).map(
        (mappedSector) => Sector.fromMap(
          mappedSector,
        ),
      ),
    );
  }
}
