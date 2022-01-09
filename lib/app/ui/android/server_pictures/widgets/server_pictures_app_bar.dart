import 'package:controle_equipamentos/app/controllers/server_pictures_controllers/server_pictures_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/action_add_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServerPicturesAppBar extends GetView<ServerPicturesController>
    implements PreferredSizeWidget {
  const ServerPicturesAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: Get.back,
      ),
      title: Text('Adicionar imagem'),
      actions: [
        Obx(
          () => ActionAddButton(
            visible: controller.selectedTiles.isNotEmpty,
            onPressed: controller.popWithPicture,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
