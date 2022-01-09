import 'package:controle_equipamentos/app/controllers/manage_machine_controllers/manage_machine_controller.dart';
import 'package:controle_equipamentos/app/ui/android/manage_machine/widgets/sector_button.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/add_picture_button/add_picture_button.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/default_text_field.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/loading_elevated_button.dart';
import 'package:controle_equipamentos/app/utils/thousend_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class ManageMachinePage extends GetView<ManageMachineController> {
  ManageMachinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.isNew
              ? 'Cadastrar de Equipamento'
              : 'Atualizar de Equipamento',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.0,
                ),
                DefaultTextField(
                  labelText: 'Nome do equipamento',
                  hintText: 'Fatiadora Equimatec',
                  validator: (_) => controller.nameError,
                  onChanged: (value) => controller.state.name = value,
                  initialValue: controller.state.name ?? '',
                  textCapitalization: TextCapitalization.words,
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
                  labelText: 'Marca do equipamento',
                  hintText: 'Equimatec',
                  validator: (_) => controller.brandError,
                  onChanged: (value) => controller.state.brand = value,
                  initialValue: controller.state.brand ?? '',
                  textCapitalization: TextCapitalization.words,
                ),
                SizedBox(
                  height: 24.0,
                ),
                DefaultTextField(
                  labelText: 'Modelo do equipamento',
                  hintText: 'FTI-600A',
                  validator: (_) => controller.modelError,
                  onChanged: (value) => controller.state.model = value,
                  initialValue: controller.state.model ?? '',
                  textCapitalization: TextCapitalization.words,
                ),
                SizedBox(
                  height: 24.0,
                ),
                SectorButton(
                  validator: (_) => controller.sectorError,
                  onSaved: (value) => controller.state.sector = value,
                  initialValue: controller.state.sector,
                ),
                SizedBox(
                  height: 24.0,
                ),
                DefaultTextField(
                  labelText: 'Tag do equipamento',
                  hintText: '497-CAR-FAT-001',
                  validator: (_) => controller.tagError,
                  onChanged: (value) => controller.state.tag = value,
                  initialValue: controller.state.tag ?? '',
                  textCapitalization: TextCapitalization.words,
                ),
                SizedBox(
                  height: 24.0,
                ),
                DefaultTextField(
                  labelText: 'Código JBS',
                  hintText: '123.123',
                  validator: (_) => controller.codeError,
                  onChanged: (value) => controller.state.code = value,
                  initialValue: controller.state.code ?? '',
                  keyboardType: TextInputType.number,
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
                  child: controller.simpleObx(
                    (state) => LoadingElevatedButton(
                      isLoading: controller.isLoadingMore,
                      onPressed: () async {
                        await controller.machineValidator();
                      },
                      child: Text(
                        controller.isNew ? 'Cadastrar' : 'Atualizar',
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
    );
  }
}
