import 'package:controle_equipamentos/app/controllers/settings_controllers/impl/user_settings_controller_impl.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:get/get.dart';

class UserSettingsController extends UserSettingsControllerImpl {
  void pushUserProfilePage() => Get.toNamed(Routes.PROFILE);
}
