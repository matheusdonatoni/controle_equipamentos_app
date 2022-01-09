import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/scalable_check_circle.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/picture_view.dart';
import 'package:controle_equipamentos/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'selectable_picture_bloc.dart';

class SelectablePicture extends StatefulWidget {
  final Picture picture;
  final void Function() onLongPress;
  final void Function() onTap;
  final bool selected;

  SelectablePicture(
    this.picture, {
    Key key,
    this.onLongPress,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  @override
  _SelectablePictureState createState() => _SelectablePictureState();
}

class _SelectablePictureState extends State<SelectablePicture> {
  SelectablePictureBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = SelectablePictureBloc();
  }

  @override
  Widget build(BuildContext context) {
    bloc.selected = widget.selected;

    return InkWell(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              if (widget.selected)
                Positioned.fill(
                  child: AnimatedContainer(
                    duration: kDuration,
                    color: Get.theme.primaryColor.withOpacity(0.18),
                  ),
                ),
              AnimatedBuilder(
                animation: bloc.controller,
                builder: (context, child) => Transform.scale(
                  scale: 1.0 - 0.2 * bloc.size.value,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      24.0 * bloc.size.value,
                    ),
                    child: child,
                  ),
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: PictureView(widget.picture),
                ),
              ),
              if (widget.selected)
                Positioned(
                  top: constraints.biggest.height * 0.05,
                  left: constraints.biggest.width * 0.05,
                  child: AnimatedBuilder(
                    animation: bloc.controller,
                    builder: (context, child) => ScalableCheckCircle(
                      scale: bloc.size.value,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
