import 'package:controle_equipamentos/app/ui/android/widgets/dialogs/loading_dialog_overlay.dart';
import 'package:get/get.dart';

class ContextualDialog {
  static void loadingOverlay({String message}) {
    Get.dialog(
      LoadingDialogOverlay(
        message: message,
      ),
      barrierDismissible: false,
    );
  }
}
