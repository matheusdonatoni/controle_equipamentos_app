import 'package:controle_equipamentos/app/controllers/login_controllers/login_controller.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/default_text_field.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/loading_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          DefaultTextField(
            validator: (_) => controller.emailError,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => controller.state.email = value,
            initialValue: controller.state.email,
            labelText: 'E-mail',
            hintText: 'login@email.com.br',
          ),
          SizedBox(
            height: 24.0,
          ),
          DefaultTextField(
            validator: (_) => controller.passwordError,
            onChanged: (value) => controller.state.password = value,
            obscureText: true,
            labelText: 'Senha',
          ),
          SizedBox(
            height: 24.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: controller.obx(
              (_) => LoadingElevatedButton(
                isLoading: controller.status.isLoadingMore,
                onPressed: () async {
                  await controller.loginValidator();
                },
                child: Text(
                  'Entrar',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text('Ou'),
          ),
          SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () async {
                await Get.toNamed(
                  Routes.REGISTER,
                );
              },
              child: Text(
                'Registrar',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
