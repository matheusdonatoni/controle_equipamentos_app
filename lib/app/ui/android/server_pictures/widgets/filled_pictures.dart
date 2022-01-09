import 'package:controle_equipamentos/app/controllers/server_pictures_controllers/server_pictures_controller.dart';
import 'package:controle_equipamentos/app/ui/android/server_pictures/widgets/selectable_picture/selectable_picture.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/lazy_single_child_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilledPictures extends GetView<ServerPicturesController> {
  const FilledPictures({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LazySingleChildScrollView(
      isLoadingMore: controller.status.isLoadingMore,
      onLoadingPortionReached: controller.onLoadingPortionReached,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.state.length,
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 12.0,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 3.0,
          crossAxisSpacing: 3.0,
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          final picture = controller.state[index];

          return Obx(
            () => SelectablePicture(
              picture,
              key: ObjectKey(picture),
              onLongPress: () => controller.onTileLongPress(picture),
              onTap: () async => await controller.onTileTap(picture),
              selected: controller.isTileSelected(picture),
            ),
          );
        },
      ),
    );
  }
}
