import 'package:controle_equipamentos/app/ui/android/widgets/dialogs/loading_dialog_body.dart';
import 'package:flutter/material.dart';

class LoadingDialogOverlay extends StatelessWidget {
  final String message;
  const LoadingDialogOverlay({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth / 2.5,
              height: constraints.maxWidth / 2.5,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(
                  4.0,
                ),
              ),
              child: LoadingDialogBody(
                message: message,
              ),
            );
          },
        ),
      ),
    );
  }
}
