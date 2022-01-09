import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/picture_view.dart';
import 'package:controle_equipamentos/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'icon_leading.dart';

class RoundedPictureLeading extends StatelessWidget {
  final Picture picture;
  final String tag;
  const RoundedPictureLeading({
    Key key,
    this.picture,
    this.tag,
  }) : super(key: key);

  bool get hasPicture => picture != null;
  bool get isEmpty => !hasPicture;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: child,
    );
  }

  Widget get child {
    if (isEmpty) return IconLeading.image();

    return AnimatedSwitcher(
      duration: kDuration,
      child: hasPicture
          ? ClipOval(
              child: PictureView(picture),
            )
          : IconLeading.image(),
    );
  }
}
