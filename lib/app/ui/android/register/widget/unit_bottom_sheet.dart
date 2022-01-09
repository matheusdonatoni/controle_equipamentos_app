import 'package:controle_equipamentos/app/data/models/unit.dart';
import 'package:controle_equipamentos/app/data/repositories/unit_repository.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/bottom_sheet_options/bottom_sheet_header.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitBottomSheet extends StatefulWidget {
  const UnitBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  _UnitBottomSheetState createState() => _UnitBottomSheetState();
}

class _UnitBottomSheetState extends State<UnitBottomSheet> {
  Future<List<Unit>> fetchUnits;
  final repo = UnitRepository();

  Future<List<Unit>> findAllSectors() async {
    return await repo.findAll().catchError((err) {
      throw err;
    });
  }

  void reload() {
    setState(fetch);
  }

  void fetch() {
    fetchUnits = findAllSectors();
  }

  @override
  void initState() {
    super.initState();

    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            4.0,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BottomSheetHeader(
            title: 'Unidades',
            message: 'Selecione sua unidade JBS',
          ),
          Expanded(
            child: SizedBox(
              child: FutureBuilder<List<Unit>>(
                future: fetchUnits,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return SizedBox();
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      var units = snapshot.data;

                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: units.length,
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            '${units[index].code} - ${units[index].name}',
                          ),
                          onTap: () {
                            Get.back(result: units[index]);
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(
                          'Nenhuma unidade cadastrada',
                          style: Get.textTheme.subtitle1,
                        ),
                      );
                    }
                  } else {
                    return Loading();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
