import 'package:controle_equipamentos/app/data/models/sector.dart';
import 'package:controle_equipamentos/app/data/repositories/sector_repository.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/bottom_sheet_options/bottom_sheet_header.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/error_view.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectorBottomSheet extends StatefulWidget {
  const SectorBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  _SectorBottomSheetState createState() => _SectorBottomSheetState();
}

class _SectorBottomSheetState extends State<SectorBottomSheet> {
  Future<List<Sector>> fetchSectors;
  final sectorRepository = SectorRepository();

  Future<List<Sector>> findAllSectors() async {
    return await sectorRepository.findAll();
  }

  @override
  void initState() {
    fetchSectors = findAllSectors();
    super.initState();
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
            title: 'Setores',
            message: 'Selecione setor do equipamento',
          ),
          Expanded(
            child: SizedBox(
              child: FutureBuilder<List<Sector>>(
                future: fetchSectors,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return ErrorView(snapshot.error);
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      var sectors = snapshot.data;

                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: sectors.length,
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (context, index) {
                          var sector = sectors[index];

                          return ListTile(
                            title: Text(
                              '${sector.name}',
                            ),
                            onTap: () {
                              Get.back<Sector>(
                                result: sector,
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          'Não foram encontrado nenhum setor...',
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
