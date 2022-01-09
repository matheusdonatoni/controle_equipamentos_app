import 'package:flutter/material.dart';

class ScalableCheckCircle extends StatelessWidget {
  final double scale;
  final Color selectionColor;
  const ScalableCheckCircle({
    Key key,
    this.scale = 1.0,
    this.selectionColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Container(
        height: 24.0,
        width: 24.0,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Icon(
          Icons.check_circle,
          color: selectionColor ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
