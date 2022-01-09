import 'package:controle_equipamentos/app/data/models/helpers/enums.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/bottom_sheet_options/bottom_sheet_header.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/bottom_sheet_options/bottom_sheet_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PictureSourceOptionsBottomSheet extends StatelessWidget {
  const PictureSourceOptionsBottomSheet({
    Key key,
    this.showServerSource = true,
  }) : super(key: key);

  final bool showServerSource;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.cardColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              4.0,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BottomSheetHeader(
                title: 'Nova imagem',
                message: 'Origem da imagem',
              ),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  BottomSheetTile(
                    title: 'Câmera',
                    icon: Icon(Icons.camera_alt),
                    onTap: () {
                      Get.back(result: PictureSource.camera);
                    },
                  ),
                  BottomSheetTile(
                    title: 'Armazenamento',
                    icon: Icon(Icons.folder),
                    onTap: () {
                      Get.back(result: PictureSource.gallery);
                    },
                  ),
                  Visibility(
                    visible: showServerSource,
                    child: BottomSheetTile(
                      title: 'Servidor',
                      icon: Icon(Icons.language),
                      onTap: () {
                        Get.back(result: PictureSource.server);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
