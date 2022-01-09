import 'package:controle_equipamentos/app/controllers/home_controllers/home_drawer_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/tiles/rounded_picture_leading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDrawer extends GetView<HomeDrawerController> {
  const HomeDrawer({Key key}) : super(key: key);

  void drawerFunction(BuildContext context, Function onTap) async {
    if (Scaffold.of(context).isDrawerOpen) Get.back();

    await onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              DrawerHeader(
                // padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 60.0,
                      child: controller.obx(
                        (state) => RoundedPictureLeading(
                          picture: controller.state.picture,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: controller.obx(
                        (state) => Text(controller.state.name),
                      ),
                      subtitle: Text(controller.state.email),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.widgets),
                title: Text('Itens'),
                onTap: () {
                  drawerFunction(context, controller.pushItemsList);
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurações'),
                onTap: () {
                  drawerFunction(context, controller.pushSettings);
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () async => await controller.logout(),
          ),
        ],
      ),
    );
  }
}
