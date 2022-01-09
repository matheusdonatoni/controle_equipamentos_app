import 'package:flutter/material.dart';

class AddPictureLabel extends StatelessWidget {
  final String label;
  final IconData icon;
  const AddPictureLabel({
    Key key,
    this.label = 'Adicionar imagem',
    this.icon = Icons.add_photo_alternate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8.0,
        children: [
          Text(label),
          Icon(icon),
        ],
      ),
    );
  }
}
