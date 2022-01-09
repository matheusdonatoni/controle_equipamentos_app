import 'package:flutter/material.dart';

class IconLeading extends StatelessWidget {
  final IconData icon;
  const IconLeading(
    this.icon, {
    Key key,
  }) : super(key: key);

  const IconLeading.image({
    Key key,
  })  : this.icon = Icons.image,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
