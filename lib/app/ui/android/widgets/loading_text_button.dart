import 'package:flutter/material.dart';

class LoadingTextButton extends StatelessWidget {
  final bool isLoading;
  final void Function() onPressed;
  final Widget child;
  const LoadingTextButton({
    Key key,
    @required this.isLoading,
    @required this.onPressed,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: TextButton(
        onPressed: onPressed,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isLoading
              ? SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                  ),
                )
              : child,
        ),
      ),
    );
  }
}
