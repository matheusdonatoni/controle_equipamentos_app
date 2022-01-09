import 'package:controle_equipamentos/app/controllers/item_controller/item_controller.dart';
import 'package:controle_equipamentos/app/data/models/item.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/specification_marker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemSpecificationsList extends GetView<ItemController> {
  const ItemSpecificationsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = controller.state;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        SpecificationMarker(
          '''Descrição: ${item.description}''',
        ),
        SizedBox(height: 4.0),
        SpecificationMarker(
          '''Código: ${item.code}''',
        ),
        SizedBox(height: 4.0),
        SpecificationMarker(
          '''Unidade de medida: ${item.measurement.name}''',
        ),
      ],
    );
  }
}
