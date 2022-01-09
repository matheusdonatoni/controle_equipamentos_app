import 'package:controle_equipamentos/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionAddButton extends StatelessWidget {
  final bool visible;
  final void Function() onPressed;
  const ActionAddButton({
    @required this.visible,
    @required this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ignoring = !visible;
    return AnimatedOpacity(
      duration: kDuration,
      opacity: visible ? 1.0 : 0.0,
      child: IgnorePointer(
        ignoring: ignoring,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Get.theme.primaryTextTheme.button.color,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 18.0,
              ),
            ),
            onPressed: onPressed,
            child: Text(
              'Adicionar',
              style: Get.textTheme.button.copyWith(
                color: Get.theme.primaryTextTheme.button.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
