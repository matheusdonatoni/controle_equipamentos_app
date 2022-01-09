import 'package:controle_equipamentos/app/controllers/settings_controllers/user_settings_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/tiles/rounded_picture_leading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserTile extends GetView<UserSettingsController> {
  const UserTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  controller.obx(
        (state) => RoundedPictureLeading(
          picture: state.picture,
        ),
      ),
      onTap: controller.pushUserProfilePage,
      title: controller.obx(
        (state) => Text(
          state.name,
        ),
      ),
      subtitle: Text(controller.state.email),
      trailing: Icon(Icons.keyboard_arrow_right_rounded),
    );
  }
}
