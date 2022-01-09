import 'package:controle_equipamentos/app/controllers/manage_catalog_controllers/manage_catalog_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/default_text_field.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/loading_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/helpers/implementations/controllers/state_mixin_extension.dart';

class ManageCatalogPage extends GetView<ManageCatalogController> {
  const ManageCatalogPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.isNew ? 'Criar Catálogo' : 'Editar Catálogo',
        ),
      ),
      body: SingleChildScrollView(
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
                validator: (_) => controller.nameError,
                onChanged: (value) => controller.state.name = value,
                labelText: 'Nome do catálogo',
                hintText: 'Controle de equipamentos',
                initialValue: controller.reference.name,
                textCapitalization: TextCapitalization.sentences,
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
                    child: Text(
                      controller.isNew ? 'Criar' : 'Atualizar',
                    ),
                    onPressed: () async {
                      await controller.createCatalogValidator();
                    },
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
    );
  }
}
