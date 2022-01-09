import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/picture_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FramedPicture extends StatelessWidget {
  final Picture picture;
  final String tag;
  const FramedPicture(
    this.picture, {
    this.tag,
    Key key,
  }) : super(key: key);

  bool get hasPicture => picture != null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          alignment: hasPicture ? Alignment.topLeft : Alignment.center,
          decoration: BoxDecoration(
            border: hasPicture
                ? null
                : Border.all(
                    color: Theme.of(context).buttonTheme.colorScheme.primary,
                  ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget get child {
    if (hasPicture) {
      return Visibility(
        visible: hasPicture,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: PictureView(picture),
        ),
        replacement: onEmpty,
      );
    } else {
      return onEmpty;
    }
  }

  Widget get onEmpty {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Get.theme.buttonTheme.colorScheme.primary,
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            'Sem registro de imagem',
            style: Get.textTheme.button.copyWith(
              color: Get.theme.buttonTheme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
