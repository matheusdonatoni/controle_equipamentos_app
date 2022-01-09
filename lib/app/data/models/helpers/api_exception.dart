import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';

class ApiException implements Exception {
  final dynamic message;

  ApiException([this.message]);

  String toString() {
    try {
      Map message = this.message;

      return "${message['error']}";
    } catch (_) {
      ContextualSnackbar.info(
        title: 'Erro',
        message: 'Ops.. ocorreu um erro inesperado!',
      );

      return 'Ops.. ocorreu um erro inesperado!';
    }
  }
}
