import 'package:controle_equipamentos/app/ui/android/widgets/bottom_sheet_options/bottom_sheet_header.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/bottom_sheet_options/bottom_sheet_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemovePictureBottomSheet extends StatelessWidget {
  const RemovePictureBottomSheet({Key key}) : super(key: key);

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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomSheetHeader(
              title: 'Remover',
              message: 'Deseja remover a imagem?',
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                BottomSheetTile(
                  title: 'Remover',
                  icon: Icon(Icons.clear),
                  onTap: () {
                    Get.back(result: true);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
