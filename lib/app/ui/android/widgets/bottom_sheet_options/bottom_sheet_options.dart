import 'package:controle_equipamentos/app/data/models/helpers/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_sheet_header.dart';
import 'bottom_sheet_tile.dart';

class BottomSheetOptions extends StatelessWidget {
  final String message;
  final List<BottomSheetTile> extraOptionTiles;
  final bool shouldShowRemove;
  final bool showDeleteOption;

  const BottomSheetOptions({
    Key key,
    @required this.message,
  })  : showDeleteOption = true,
        shouldShowRemove = false,
        extraOptionTiles = const [],
        super(key: key);

  const BottomSheetOptions.withRemoveOption({
    Key key,
    @required this.message,
  })  : showDeleteOption = true,
        shouldShowRemove = false,
        extraOptionTiles = const [],
        super(key: key);

  const BottomSheetOptions.editOnly({
    Key key,
    @required this.message,
  })  : extraOptionTiles = const [],
        shouldShowRemove = false,
        showDeleteOption = false,
        super(key: key);

  const BottomSheetOptions.withExtraOptions({
    Key key,
    @required this.message,
    this.extraOptionTiles = const [],
    this.showDeleteOption = true,
    this.shouldShowRemove = false,
  }) : super(key: key);

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
              title: 'Opções',
              message: message,
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                BottomSheetTile(
                  title: 'Editar',
                  icon: Icon(Icons.edit),
                  onTap: () {
                    Get.back(result: ObjectAction.edit);
                  },
                ),
                ...extraOptionTiles,
                if (showDeleteOption)
                  BottomSheetTile(
                    title: shouldShowRemove ? 'Remover' : 'Deletar',
                    icon: Icon(Icons.delete_rounded),
                    onTap: () {
                      Get.back(result: ObjectAction.delete);
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
