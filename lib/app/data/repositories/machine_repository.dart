import 'package:controle_equipamentos/app/data/models/catalog.dart';
import 'package:controle_equipamentos/app/data/models/helpers/api_exception.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/repositories/picture_mixin.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/repositories/rel_repository_impl.dart';
import 'package:controle_equipamentos/app/data/models/machine.dart';
import 'package:controle_equipamentos/app/data/providers/api.dart';
import 'package:get/get.dart';

class MachineRepository extends RelRepositoryImpl<Machine>
    with PictureManagerMixin {
  Api get api => Get.find();

  Future<int> count(Catalog catalog) async {
    var res = await api.countMachines(catalog);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.body;
  }

  Future<List<Machine>> findAllWhere({
    Catalog catalog,
    int from,
    int to,
  }) async {
    var res = await api.findMachinesSlice(
      from: from,
      to: to,
      catalog: catalog,
    );

    if (res.hasError) {
      throw ApiException(res.body);
    }

    var machines = List<Machine>.from(
      (res.body as List).map(
        (mappedMachine) => Machine.fromMap(mappedMachine),
      ),
    );

    await Future.forEach<Machine>(
      machines,
      (machine) async => machine
        ..picture = await findPicture(
          machine.picture.id,
        ),
    );

    return machines;
  }

  Future<Machine> create(Machine machine, Catalog catalog) async {
    machine.picture = await createPicture(machine.picture);

    var res = await api.createMachine(machine, catalog);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    machine = Machine.fromMap(res.body);

    return machine;
  }

  @override
  Future<Machine> update(Machine machine) async {
    machine.picture = await createPicture(machine.picture);

    var res = await api.updateMachine(machine);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    machine = Machine.fromMap(res.body).copyWith(
      categories: machine.categories,
    );

    return machine..picture = await findPicture(machine.picture.id);
  }

  Future<Machine> find(int id, [_]) async {
    var res = await api.findMachine(id);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    var machine = Machine.fromMap(res.body);

    return machine;
  }

  Future<bool> delete(Machine machine) async {
    var res = await api.deleteMachine(machine);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.isOk;
  }

  Future<bool> isNameUnique(Machine machine, Catalog catalog) async {
    var res = await api.isMachineNameUnique(machine, catalog);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.body['result'];
  }

  Future<bool> isCodeUnique(Machine machine, Catalog catalog) async {
    var res = await api.isMachineCodeUnique(machine, catalog);

    if (res.hasError) {
      throw ApiException(res.body);
    }

    return res.body['result'];
  }
}
