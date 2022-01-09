import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/snackbars/contextual_snackbar.dart';

import 'impl/profile_controller_impl.dart';

class ProfileController extends ProfileControllerImpl {
  Future<void> onPictureChanged(Picture picture) async {
    user.picture = picture;

    await authRepository.update(user).then(
      (val) {
        user = val;
      },
      onError: ContextualSnackbar.error,
    );
  }
}
