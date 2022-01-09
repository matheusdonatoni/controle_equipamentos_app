import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../loading_text_button.dart';
import 'dialog_loading_bottom_buttons.dart';

class ConfirmExclusionDialog extends StatefulWidget {
  final String name;
  final Future<void> Function() onConfirmDeletePressed;
  final bool shouldShowRemove;
  ConfirmExclusionDialog(
    this.name, {
    Key key,
    this.onConfirmDeletePressed,
    this.shouldShowRemove = false,
  }) : super(key: key);

  @override
  _ConfirmExclusionDialogState createState() => _ConfirmExclusionDialogState();
}

class _ConfirmExclusionDialogState extends State<ConfirmExclusionDialog> {
  bool isLoading = false;

  void toggle() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  String get actionKeyWord => widget.shouldShowRemove ? 'remover' : 'deletar';

  String get upperActionKeyWord => actionKeyWord.replaceRange(
        0,
        1,
        actionKeyWord[0].toUpperCase(),
      );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 152.0,
        padding: EdgeInsets.only(
          left: 18.0,
          top: 18.0,
          right: 12.0,
          bottom: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Você está prestes a $actionKeyWord:\n',
                  style: Get.textTheme.subtitle1,
                ),
                Text(
                  '${widget.name}',
                  style: Get.textTheme.bodyText1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogLoadingBottomButtons(
                  isLoading: isLoading,
                  actionLabel: upperActionKeyWord,
                  onActionPressed: () async {
                    toggle();
                    await widget.onConfirmDeletePressed();
                    toggle();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
