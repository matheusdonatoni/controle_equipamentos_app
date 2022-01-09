import 'package:controle_equipamentos/app/utils/constants.dart';
import 'package:flutter/material.dart';

class LoadingElevatedButton extends StatelessWidget {
  final bool isLoading;
  final void Function() onPressed;
  final Widget child;
  const LoadingElevatedButton({
    Key key,
    @required this.isLoading,
    @required this.onPressed,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(64, 48),
        ),
        onPressed: onPressed,
        child: AnimatedSwitcher(
          duration: kDuration,
          child: isLoading
              ? SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    backgroundColor: Theme.of(context).accentIconTheme.color,
                  ),
                )
              : child,
        ),
      ),
    );
  }
}
