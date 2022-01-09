import 'package:controle_equipamentos/app/controllers/manage_item_controller/manage_item_controller.dart';
import 'package:controle_equipamentos/app/ui/android/manage_item/widgets/measurement_button.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/add_picture_button/add_picture_button.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/default_text_field.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/loading_elevated_button.dart';
import 'package:controle_equipamentos/app/utils/thousend_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class ManageItemPage extends GetView<ManageItemController> {
  const ManageItemPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.reference.isNew ? 'Cadastrar item' : 'Atualizar item',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 24.0,
                  ),
                  DefaultTextField(
                    hintText: 'Rolamento',
                    labelText: 'Nome',
                    initialValue: controller.reference.name,
                    textCapitalization: TextCapitalization.sentences,
                    onChanged: (value) => controller.state.name = value,
                    validator: (_) => controller.nameError,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Obx(
                    () => AddPictureButton.squared(
                      onChanged: controller.onPictureChanged,
                      picture: controller.state.picture,
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  DefaultTextField(
                    hintText: 'ROLAMENTO;DIM 10MM;Fabr/Ref: NSK/N10',
                    labelText: 'Descrição',
                    initialValue: controller.reference.description,
                    textCapitalization: TextCapitalization.sentences,
                    onChanged: (value) => controller.state.description = value,
                    validator: (_) => controller.descriptionError,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  MeasurementButton(
                    validator: (_) => controller.measurementError,
                    onChanged: (value) => controller.state.measurement = value,
                    initialValue: controller.reference.measurement,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  DefaultTextField(
                    hintText: '123.456',
                    labelText: 'Código JBS',
                    initialValue: controller.reference.code,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => controller.state.code = value,
                    validator: (_) => controller.codeError,
                    inputFormatters: [
                      ThousendFormatter(),
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]+([.][0-9]+)*$'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  SizedBox(
                    height: 48.0,
                    width: MediaQuery.of(context).size.width,
                    child: controller.obx(
                      (state) => LoadingElevatedButton(
                        isLoading: controller.isLoadingMore,
                        onPressed: () async {
                          await controller.itemValidator();
                        },
                        child: Text(
                          controller.reference.isNew
                              ? 'Cadastrar'
                              : 'Atualizar',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
