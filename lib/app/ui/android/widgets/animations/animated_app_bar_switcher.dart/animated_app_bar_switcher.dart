import 'package:controle_equipamentos/app/utils/constants.dart';
import 'package:flutter/material.dart';

class AnimatedAppBarSwitcher extends StatelessWidget {
  final bool showFirst;
  final Widget firstAppBar;
  final Widget secondAppBar;
  final Widget backgroundAppBar;
  const AnimatedAppBarSwitcher({
    Key key,
    this.firstAppBar,
    this.secondAppBar,
    this.showFirst = true,
    this.backgroundAppBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kDuration,
      child: showFirst ? firstAppBar : secondAppBar,
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          children: <Widget>[
            // Will prevent blink effect.
            backgroundAppBar ??
                AppBar(
                  elevation: 0.0,
                ),
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
          alignment: Alignment.center,
        );
      },
    );
  }
}
