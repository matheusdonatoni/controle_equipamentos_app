import 'package:controle_equipamentos/app/controllers/server_pictures_controllers/server_pictures_controller.dart';
import 'package:controle_equipamentos/app/ui/android/server_pictures/widgets/empty_picture_list.dart';
import 'package:controle_equipamentos/app/ui/android/server_pictures/widgets/filled_pictures.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/server_pictures_app_bar.dart';

class ServerPicturesPage extends GetView<ServerPicturesController> {
  const ServerPicturesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ServerPicturesAppBar(),
      body: controller.obx(
        (state) => state.isEmpty ? EmptyPictureList() : FilledPictures(),
        onEmpty: EmptyPictureList(),
        onError: (error) => ErrorView(error),
      ),
    );
  }
}
