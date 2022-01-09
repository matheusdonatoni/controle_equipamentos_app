import 'package:controle_equipamentos/app/controllers/register_controllers/register_controller.dart';
import 'package:controle_equipamentos/app/ui/android/register/widget/unit_button.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/add_picture_button/add_picture_button.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/add_picture_button/add_picture_label.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/default_text_field.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/loading_elevated_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterForm extends GetView<RegisterController> {
  RegisterForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 48.0,
              vertical: 24.0,
            ),
            child: Obx(
              () => AddPictureButton.rounded(
                emptyLabel: AddPictureLabel(
                  label: 'Adicionar imagem de perfil',
                ),
                picture: controller.state.picture,
                onChanged: controller.onPictureChanged,
                showServerSource: false,
              ),
            ),
          ),
          DefaultTextField(
            validator: (_) => controller.nameError,
            keyboardType: TextInputType.name,
            labelText: 'Nome',
            hintText: 'Seu nome completo',
            onChanged: (name) => controller.state.name = name,
          ),
          SizedBox(
            height: 24.0,
          ),
          DefaultTextField(
            validator: (_) => controller.emailError,
            keyboardType: TextInputType.emailAddress,
            labelText: 'E-mail',
            hintText: 'login@email.com.br',
            onChanged: (email) => controller.state.email = email,
          ),
          SizedBox(
            height: 24.0,
          ),
          UnitButton(
            validator: (_) => controller.unitError,
            onSaved: (unit) {
              if (unit != null) controller.state.unit = unit;
            },
          ),
          SizedBox(
            height: 24.0,
          ),
          DefaultTextField(
            validator: (_) => controller.passwordError,
            obscureText: true,
            labelText: 'Senha',
            onChanged: (password) => controller.state.password = password,
          ),
          SizedBox(
            height: 24.0,
          ),
          DefaultTextField(
            validator: (_) => controller.confirmPasswordError,
            obscureText: true,
            labelText: 'Confirmar senha',
            onChanged: (confirmPassword) =>
                controller.confirmPassword = confirmPassword,
          ),
          SizedBox(
            height: 24.0,
          ),
          SizedBox(
            width: Get.width,
            child: controller.obx(
              (_) => LoadingElevatedButton(
                isLoading: controller.status.isLoadingMore,
                child: Text(
                  'Registrar',
                ),
                onPressed: () async {
                  await controller.registerValidator();
                },
              ),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
  }
}
