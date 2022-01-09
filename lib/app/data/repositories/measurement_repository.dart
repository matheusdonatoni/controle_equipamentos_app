import 'package:controle_equipamentos/app/data/models/helpers/api_exception.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/repositories/ref_repository_impl.dart';
import 'package:controle_equipamentos/app/data/models/measurement.dart';

class MeasurementRepository extends RefRepositoryImpl<Measurement> {
  @override
  Future<List<Measurement>> findAll() async {
    var res = await api.findAllMeasurements();

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return List<Measurement>.from(
      (res.body).map(
        (mappedMeasurement) => Measurement.fromMap(
          mappedMeasurement,
        ),
      ),
    );
  }
}
