import 'package:flutter/material.dart';

class BottomSheetTile extends StatelessWidget {
  final void Function() onTap;
  final void Function() onLongPress;
  final Icon icon;
  final String title;
  const BottomSheetTile({
    Key key,
    @required this.title,
    @required this.onTap,
    this.onLongPress,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      onTap: onTap,
      onLongPress: onLongPress,
      title: Text(title),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}
