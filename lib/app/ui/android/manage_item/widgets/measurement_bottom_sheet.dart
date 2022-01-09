import 'package:controle_equipamentos/app/data/models/measurement.dart';
import 'package:controle_equipamentos/app/data/repositories/measurement_repository.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/bottom_sheet_options/bottom_sheet_header.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeasurementBottomSheet extends StatefulWidget {
  const MeasurementBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  _MeasurementBottomSheetState createState() => _MeasurementBottomSheetState();
}

class _MeasurementBottomSheetState extends State<MeasurementBottomSheet> {
  Future<List<Measurement>> fetchMeasurement;
  final repo = MeasurementRepository();

  Future<List<Measurement>> findAllMeasurements() async {
    return await repo.findAll().catchError((err) {
      throw err;
    });
  }

  void reload() {
    setState(fetch);
  }

  void fetch() {
    fetchMeasurement = findAllMeasurements();
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetHeader(
            title: 'Unidades de medida',
            message: 'Selecione uma unidade de medida',
          ),
          Expanded(
            child: SizedBox(
              child: FutureBuilder<List<Measurement>>(
                future: findAllMeasurements(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                   return SizedBox();
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      var measurments = snapshot.data;

                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: measurments.length,
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            '${measurments[index].name}',
                          ),
                          onTap: () {
                            Get.back(result: measurments[index]);
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(
                          'Nenhuma unidade de medida cadastrada',
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
