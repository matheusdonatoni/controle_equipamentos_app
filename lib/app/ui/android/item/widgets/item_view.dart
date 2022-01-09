import 'package:controle_equipamentos/app/controllers/item_controller/item_controller.dart';
import 'package:controle_equipamentos/app/ui/android/item/widgets/item_specifications_list.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/framed_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemView extends GetView<ItemController> {
  const ItemView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = controller.state;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.0,
          ),
          FramedPicture(
            item.picture,
            tag: item.runtimeType.toString() + item.id.toString(),
          ),
          SizedBox(
            height: 24.0,
          ),
          ItemSpecificationsList(),
          SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
  }
}
