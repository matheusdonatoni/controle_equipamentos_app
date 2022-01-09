import 'package:controle_equipamentos/app/controllers/profile_controllers/impl/edit_user_name_controller_impl.dart';
import 'package:controle_equipamentos/app/data/models/helpers/implementations/controllers/state_mixin_extension.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';
import 'package:get/get.dart';

class EditUserNameController extends EditUserNameControllerImpl {
  String nameError;

  void nameValidator() {
    if (value.name == null) {
      nameError = 'Digite seu nome';
    } else if (value.name.isEmpty) {
      nameError = 'Digite seu nome';
    } else {
      nameError = null;
    }
  }

  Future<void> editNameValidator() async {
    nameValidator();

    changeToLoadingMore();

    if (formKey.currentState.validate()) {
      await authRepository.update(value).then(
        (val) {
          user = val;

          Get.back();
        },
        onError: ContextualSnackbar.error,
      );
    }

    changeToSuccess();
  }

  @override
  void onInit() {
    super.onInit();

    assign(user.copyWith());
  }
}
