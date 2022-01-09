import 'package:controle_equipamentos/app/controllers/profile_controllers/profile_controller.dart';
import 'package:controle_equipamentos/app/ui/android/profile/widgets/edit_user_name_bottom_sheet.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/add_picture_button/add_picture_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: SizedBox(
                width: 200,
                child: controller.obx(
                  (state) => AddPictureButton.rounded(
                    onChanged: (picture) async =>
                        await controller.onPictureChanged(picture),
                    picture: state.picture,
                    showServerSource: false,
                  ),
                ),
              ),
            ),
          ),
          controller.obx(
            (state) => ListTile(
              onTap: () async => await Get.bottomSheet(
                EditUserNameBottomSheet(),
              ),
              leading: Icon(Icons.person),
              title: Text('Nome'),
              subtitle: Text(state.name),
              trailing: Icon(Icons.edit),
            ),
          ),
          controller.obx(
            (state) => ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Hierarquia'),
              subtitle: Text(state.role.parsedName),
              trailing: Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
