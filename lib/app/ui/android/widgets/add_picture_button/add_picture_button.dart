import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/add_picture_button/bloc/add_picture_button_bloc.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/picture_view.dart';
import 'package:controle_equipamentos/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_picture_label.dart';

class AddPictureButton extends GetView<AddPictureButtonBloc> {
  final void Function(Picture) onChanged;
  final Widget emptyLabel;
  final Picture picture;
  final bool rounded;
  final bool showServerSource;

  bool get hasPicture => picture != null;

  AddPictureButton.squared({
    Key key,
    this.onChanged,
    this.picture,
    this.showServerSource = true,
    this.emptyLabel = const AddPictureLabel(),
  })  : rounded = false,
        super(key: key) {
    putController();
  }

  AddPictureButton.rounded({
    Key key,
    this.onChanged,
    this.picture,
    this.showServerSource = true,
    this.emptyLabel = const AddPictureLabel(),
  })  : rounded = true,
        super(key: key) {
    putController();
  }

  void putController() => Get.put<AddPictureButtonBloc>(
        AddPictureButtonBloc(
          picture,
          onChanged: onChanged,
          showServerSource: showServerSource,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: rounded
              ? StadiumBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    4.0,
                  ),
                ),
        ),
        onPressed: () async {
          await controller.onPressed();
        },
        onLongPress: () async {
          await controller.onLongPress();
        },
        child: child,
      ),
    );
  }

  Widget get child => AnimatedSwitcher(
        duration: kDuration,
        child: hasPicture ? pictureLayout : emptyLabel,
      );

  Widget get pictureLayout {
    if (rounded) {
      return ClipOval(
        child: PictureView(
          picture,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(
        4.0,
      ),
      child: PictureView(
        picture,
      ),
    );
  }
}
