import 'package:controle_equipamentos/app/controllers/profile_controllers/edit_user_name_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/bottom_sheet_options/bottom_sheet_header.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/default_text_field.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/loading_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUserNameBottomSheet extends GetView<EditUserNameController> {
  EditUserNameBottomSheet({Key key}) : super(key: key) {
    Get.lazyPut(() => EditUserNameController());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            4.0,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetHeader(
            title: 'Nome',
            message: 'Alterar seu nome',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: controller.formKey,
              child: DefaultTextField(
                autoFocus: true,
                validator: (_) => controller.nameError,
                labelText: 'Nome',
                hintText: 'Seu nome completo',
                keyboardType: TextInputType.name,
                initialValue: controller.state.name,
                onChanged: (name) => controller.state.name = name,
              ),
            ),
          ),
          SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: Get.back,
                  child: Text('Cancelar'),
                ),
                SizedBox(width: 12.0),
                controller.obx(
                  (state) => LoadingTextButton(
                    isLoading: controller.status.isLoadingMore,
                    child: Text('Salvar'),
                    onPressed: () => controller.editNameValidator(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
