import 'package:flutter/material.dart';

import '../loading_text_button.dart';

class DialogLoadingBottomButtons extends StatelessWidget {
  final bool isLoading;
  final String actionLabel;
  final void Function() onActionPressed;
  const DialogLoadingBottomButtons({
    Key key,
    @required this.isLoading,
    @required this.actionLabel,
    @required this.onActionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IgnorePointer(
          ignoring: isLoading,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
        ),
        SizedBox(width: 8.0),
        LoadingTextButton(
          isLoading: isLoading,
          onPressed: onActionPressed,
          child: Text(
            actionLabel,
          ),
        ),
      ],
    );
  }
}
